const PostHog = require('posthog-node');
const pluralize = require('pluralize');
const uniqid = require('uniqid');
const { sanitizeEntity } = require('strapi-utils');
const settings = strapi.config.middleware.settings.posthog;

module.exports = (strapi) => {
  return {
    initialize() {
      strapi.app.use(async (ctx, next) => {
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

        let payload = {
          app: ctx.app,
          request: {
            method: ctx.request.method,
            url: ctx.request.url,
            path: ctx.request.path,
            model,
            query: ctx.query,
            params: ctx.params,
            ip: ctx.ip,
          },
          response: {
            status: ctx.response.status,
          },
          user: {
            uid,
            userData,
          },
        };

        if (settings.send === true) {
          try {
            const client = new PostHog(settings.key, { host: settings.host });

            if (model && model in strapi.models) {
              console.log('I Ran!');
              client.capture({
                distinctId: uid,
                event: payload.request.method + ' ' + payload.request.model,
                properties: payload,
              });
            }
          } catch (error) {
            //
          }
        }
      });
    },
  };
};
