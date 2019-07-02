'use strict';

/**
 * System.js controller
 *
 * @description: A set of functions called "actions" for managing `System`.
 */

module.exports = {

  /**
   * Retrieve system records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await System.count());
    if (ctx.query._q) {
      return strapi.services.system.search(ctx.query);
    } else {
      return strapi.services.system.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a system record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.system.fetch(ctx.params);
  },

  /**
   * Count system records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.system.count(ctx.query, populate);
  },

  /**
   * Create a/an system record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.system.add(ctx.request.body);
  },

  /**
   * Update a/an system record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.system.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an system record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.system.remove(ctx.params);
  }
};
