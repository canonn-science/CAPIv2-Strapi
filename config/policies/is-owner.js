'use strict';

/**
 * `isOwner` policy.
 * This is used to check if the user requesting the resource is the owner of the resource
 */

module.exports = async (ctx, next) => {
  // Add your own logic here.
  console.log('In isOwner policy.');

  if (!ctx.state.user) {
    console.log('There is no user, public');
    await next();
  } else {
    console.log(ctx.state.user);
    await next();
  }
};
