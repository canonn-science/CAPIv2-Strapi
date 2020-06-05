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
          Sentry.captureException(error);
          throw error;
        }
      });
    },
  };
};
