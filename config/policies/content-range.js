module.exports = async (ctx, next) => {
  let model = ctx.request.route.controller;

  if (ctx.request.query._q) {
    try {
      ctx.set(
        'Content-Range',
        await strapi.query(model).countSearch(ctx.request.query)
      );
    } catch (error) {
      throw new Error('Failed to set countSearch header on model:' + model);
    }
  } else {
    try {
      ctx.set(
        'Content-Range',
        await strapi.query(model).count(ctx.request.query)
      );
    } catch (error) {
      throw new Error('Failed to set count header on model:' + model);
    }
  }

  return await next();
};
