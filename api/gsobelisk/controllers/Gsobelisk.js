'use strict';

/**
 * Gsobelisk.js controller
 *
 * @description: A set of functions called "actions" for managing `Gsobelisk`.
 */

module.exports = {

  /**
   * Retrieve gsobelisk records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Gsobelisk.count());
    if (ctx.query._q) {
      return strapi.services.gsobelisk.search(ctx.query);
    } else {
      return strapi.services.gsobelisk.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a gsobelisk record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gsobelisk.fetch(ctx.params);
  },

  /**
   * Count gsobelisk records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.gsobelisk.count(ctx.query, populate);
  },

  /**
   * Create a/an gsobelisk record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gsobelisk.add(ctx.request.body);
  },

  /**
   * Update a/an gsobelisk record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gsobelisk.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gsobelisk record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gsobelisk.remove(ctx.params);
  }
};
