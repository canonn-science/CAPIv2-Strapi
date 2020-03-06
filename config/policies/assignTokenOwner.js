'use strict';

module.exports = async (ctx, next) => {
  if (ctx.state.user.id) {
    if (
      (ctx.state.user.id !== ctx.request.body.user) ||
      (!ctx.request.body.user)
    ) {
      ctx.request.body.user = ctx.state.user.id;
    }

    if (
      (!ctx.request.body.token) ||
      (ctx.request.body.token.length < strapi.models.authtoken.attributes.token.minLength)
    ) {
      return ctx.badRequest('Token is missing or does not meet length requirements');
    } else {
      await next();
    }
  }
  return ctx.unauthorized();
};
