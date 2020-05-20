module.exports = async (ctx, next) => {
  let model = ctx.request.route.controller;

  if (ctx.request.query._q) {
    ctx.set(
      'Content-Range',
      await strapi.query(model).countSearch(ctx.request.query)
    );
  } else {
    ctx.set(
      'Content-Range',
      await strapi.query(model).count(ctx.request.query)
    );
  }

  return await next();
};
