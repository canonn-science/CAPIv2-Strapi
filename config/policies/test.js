module.exports = async (ctx, next) => {
  console.log('test');
  return await next();
};
