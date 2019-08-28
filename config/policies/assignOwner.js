'use strict';

/**
 * `assignOwner` policy.
 */

module.exports = async (ctx, next) => {
  // Add your own logic here.
  console.log('In assignOwner policy.');

  await next();
};
