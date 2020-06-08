const pluralize = require('pluralize');

module.exports = strapi => {
  return {
    initialize() {
      strapi.app.use(async (ctx, next) => {
        await next();

        // Breakdown the Koa ctx.request.url to get plural model
        let args = ctx.request.url.split(/\/|\?/);

        // Convert plural to singular
        let model;
        if (args) {
          model = pluralize.singular(args[1]);
        }

        // Only match find queries not findOne/count or any other method
        if(
          ctx.request.method === 'GET' &&
          ctx.params['id'] === undefined &&
          ctx.params['id'] !== 'count' &&
          model &&
          model in strapi.models
        ){
          if (ctx.request.query._q) {
            // Do countSearch and set header
            try {
              ctx.set(
                'Content-Range',
                await strapi.query(model).countSearch(ctx.request.query)
              );
            } catch (error) {
              throw new Error('Failed to set countSearch header on model:' + model);
            }
          } else {
            // Do count and set header
            try {
              ctx.set(
                'Content-Range',
                await strapi.query(model).count(ctx.request.query)
              );
            } catch (error) {
              throw new Error('Failed to set count header on model:' + model);
            }
          }
        }
      });
    },
  };
};
