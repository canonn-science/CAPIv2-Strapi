module.exports = async (ctx, next) => {
  if (!ctx.request.body.subtype) {
    ctx.request.body.subtype = 'Unknown';
  }
  await next();
};
