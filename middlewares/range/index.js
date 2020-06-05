module.exports = strapi => {
  return {
    initialize() {
      strapi.app.use(async (ctx, next) => {
        await next();
        console.log(ctx);
      });
    },
  };
};
