'use strict';

/**
 * Cmdr.js controller
 *
 * @description: A set of functions called "actions" for managing `Cmdr`.
 */

module.exports = {

  /**
   * Retrieve cmdr records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Cmdr.count());
    if (ctx.query._q) {
      return strapi.services.cmdr.search(ctx.query);
    } else {
      return strapi.services.cmdr.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a cmdr record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.cmdr.fetch(ctx.params);
  },

  /**
   * Count cmdr records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.cmdr.count(ctx.query, populate);
  },

  /**
   * Create a/an cmdr record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.cmdr.add(ctx.request.body);
  },

  /**
   * Update a/an cmdr record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.cmdr.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an cmdr record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.cmdr.remove(ctx.params);
  }
};
