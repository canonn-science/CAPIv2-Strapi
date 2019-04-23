'use strict';

/**
 * Ring.js controller
 *
 * @description: A set of functions called "actions" for managing `Ring`.
 */

module.exports = {

  /**
   * Retrieve ring records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Ring.count());
    if (ctx.query._q) {
      return strapi.services.ring.search(ctx.query);
    } else {
      return strapi.services.ring.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a ring record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.ring.fetch(ctx.params);
  },

  /**
   * Count ring records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.ring.count(ctx.query, populate);
  },

  /**
   * Create a/an ring record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.ring.add(ctx.request.body);
  },

  /**
   * Update a/an ring record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.ring.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an ring record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.ring.remove(ctx.params);
  }
};
