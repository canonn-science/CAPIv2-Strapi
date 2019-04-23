'use strict';

/**
 * Gractiveobelisk.js controller
 *
 * @description: A set of functions called "actions" for managing `Gractiveobelisk`.
 */

module.exports = {

  /**
   * Retrieve gractiveobelisk records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Gractiveobelisk.count());
    if (ctx.query._q) {
      return strapi.services.gractiveobelisk.search(ctx.query);
    } else {
      return strapi.services.gractiveobelisk.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a gractiveobelisk record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gractiveobelisk.fetch(ctx.params);
  },

  /**
   * Count gractiveobelisk records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.gractiveobelisk.count(ctx.query, populate);
  },

  /**
   * Create a/an gractiveobelisk record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gractiveobelisk.add(ctx.request.body);
  },

  /**
   * Update a/an gractiveobelisk record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gractiveobelisk.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gractiveobelisk record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gractiveobelisk.remove(ctx.params);
  }
};
