const Countly = require('countly-sdk-nodejs');
const pluralize = require('pluralize');
const uniqid = require('uniqid');
const { sanitizeEntity } = require('strapi-utils');
const settings = strapi.config.middleware.settings.countly;

module.exports = (strapi) => {
  return {
    initialize() {
      strapi.app.use(async (ctx, next) => {
        await Countly.init({
          app_key: settings.key,
          url: settings.host,
          debug: settings.debug,
          app_version: 'test-1',
          ip_address: ctx.ip,
        });

        await Countly.begin_session();

        await next();

        // Breakdown the Koa ctx.request.url to get plural model
        let args = ctx.request.url.split(/\/|\?/);

        // Convert plural to singular
        let model;
        if (args.length >= 2) {
          model = pluralize.singular(args[1]);
        }

        // Grabbing User data from ctx and creating a unique ID
        let uid;
        let userData;
        if (ctx.state.admin) {
          uid = uniqid(`admin-${ctx.state.admin.id}-`);
          userData = strapi.admin.services.user.sanitizeUser(ctx.state.user);
          userData.userType = 'admin';
        } else if (ctx.state.user) {
          uid = uniqid(`user-${ctx.state.user.id}-`);
          userData = sanitizeEntity(ctx.state.user, {
            model: strapi.query('user', 'users-permissions').model,
          });
          userData.userType = 'user';
        } else {
          uid = uniqid('anon-0-');
          userData = { userType: 'anon' };
        }

        // try {
        //   // Only send model analytics, skip admin and graphql
        //   if (model && model in strapi.models) {
        //   }
        // } catch (error) {
        //   // Do nothing
        // }

        await Countly.add_event({
          key: 'apiRequest',
          route: ctx.request.method + ' ' + ctx.request.path,
          $current_url: strapi.config.server.url + ctx.request.path,
          method: ctx.request.method,
          path: ctx.request.path,
          status: ctx.response.status,
          model,
          query: ctx.query,
          params: ctx.params,
          userData,
          requestBody: ctx.request.body,
          requestHeaders: ctx.request.headers,
          responseHeaders: ctx.response.headers,
        });
        await Countly.end_session();
      });
    },
  };
};
