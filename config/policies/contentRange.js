module.exports = async (ctx, next) => {
  let model = ctx.request.route.controller;

  ctx.set('Content-Range', await strapi.query(model).count(ctx.request.query));

  return await next();
};
