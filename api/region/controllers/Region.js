'use strict';

/**
 * Region.js controller
 *
 * @description: A set of functions called "actions" for managing `Region`.
 */

module.exports = {

  /**
   * Retrieve region records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Region.count());
    if (ctx.query._q) {
      return strapi.services.region.search(ctx.query);
    } else {
      return strapi.services.region.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a region record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.region.fetch(ctx.params);
  },

  /**
   * Count region records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.region.count(ctx.query);
  },

  /**
   * Create a/an region record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.region.add(ctx.request.body);
  },

  /**
   * Update a/an region record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.region.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an region record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.region.remove(ctx.params);
  }
};
