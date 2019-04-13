'use strict';

/**
 * Pointofinterest.js controller
 *
 * @description: A set of functions called "actions" for managing `Pointofinterest`.
 */

module.exports = {

  /**
   * Retrieve pointofinterest records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Pointofinterest.count());
    if (ctx.query._q) {
      return strapi.services.pointofinterest.search(ctx.query);
    } else {
      return strapi.services.pointofinterest.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a pointofinterest record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.pointofinterest.fetch(ctx.params);
  },

  /**
   * Count pointofinterest records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.pointofinterest.count(ctx.query);
  },

  /**
   * Create a/an pointofinterest record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.pointofinterest.add(ctx.request.body);
  },

  /**
   * Update a/an pointofinterest record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.pointofinterest.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an pointofinterest record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.pointofinterest.remove(ctx.params);
  }
};
