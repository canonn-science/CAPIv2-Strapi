const Sentry = require('@sentry/node');

const settings = strapi.config.middleware.settings.sentry;

Sentry.init({
  dsn: settings.url,
  environment: settings.sentryEnv,
});

module.exports = strapi => {
  return {
    initialize() {
      strapi.app.use(async (ctx, next) => {
        try {
          await next();
        } catch (error) {
          Sentry.withScope(scope => {
            scope.setTags({
              'strapi-env': ctx.app.env
            });
            scope.setExtras({
              request: ctx.request,
              app: ctx.app,
              params: ctx.params,
              query: ctx.query,
              headers: ctx.headers
            });
            Sentry.captureException(error);
          });
          throw error;
        }
      });
    },
  };
};
