module.exports = async (ctx, next) => {
  if (!ctx.request.body.subtype) {
    ctx.request.body.subtype = 'Unknown';
  }
  return await next();
};
