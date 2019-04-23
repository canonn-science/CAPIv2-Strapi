'use strict';

/**
 * Excludeuss.js controller
 *
 * @description: A set of functions called "actions" for managing `Excludeuss`.
 */

module.exports = {

  /**
   * Retrieve excludeuss records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Excludeuss.count());
    if (ctx.query._q) {
      return strapi.services.excludeuss.search(ctx.query);
    } else {
      return strapi.services.excludeuss.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a excludeuss record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.excludeuss.fetch(ctx.params);
  },

  /**
   * Count excludeuss records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.excludeuss.count(ctx.query, populate);
  },

  /**
   * Create a/an excludeuss record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.excludeuss.add(ctx.request.body);
  },

  /**
   * Update a/an excludeuss record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.excludeuss.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an excludeuss record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.excludeuss.remove(ctx.params);
  }
};
