'use strict';

/**
 * Excludecmdr.js controller
 *
 * @description: A set of functions called "actions" for managing `Excludecmdr`.
 */

module.exports = {

  /**
   * Retrieve excludecmdr records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Excludecmdr.count());
    if (ctx.query._q) {
      return strapi.services.excludecmdr.search(ctx.query);
    } else {
      return strapi.services.excludecmdr.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a excludecmdr record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.excludecmdr.fetch(ctx.params);
  },

  /**
   * Count excludecmdr records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.excludecmdr.count(ctx.query, populate);
  },

  /**
   * Create a/an excludecmdr record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.excludecmdr.add(ctx.request.body);
  },

  /**
   * Update a/an excludecmdr record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.excludecmdr.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an excludecmdr record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.excludecmdr.remove(ctx.params);
  }
};
