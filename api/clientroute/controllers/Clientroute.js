'use strict';

/**
 * Clientroute.js controller
 *
 * @description: A set of functions called "actions" for managing `Clientroute`.
 */

module.exports = {

  /**
   * Retrieve clientroute records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Clientroute.count());
    if (ctx.query._q) {
      return strapi.services.clientroute.search(ctx.query);
    } else {
      return strapi.services.clientroute.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a clientroute record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.clientroute.fetch(ctx.params);
  },

  /**
   * Count clientroute records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.clientroute.count(ctx.query, populate);
  },

  /**
   * Create a/an clientroute record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.clientroute.add(ctx.request.body);
  },

  /**
   * Update a/an clientroute record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.clientroute.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an clientroute record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.clientroute.remove(ctx.params);
  }
};
