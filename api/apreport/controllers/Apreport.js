'use strict';

/**
 * Apreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Apreport`.
 */

module.exports = {

  /**
   * Retrieve apreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Apreport.count());
    if (ctx.query._q) {
      return strapi.services.apreport.search(ctx.query);
    } else {
      return strapi.services.apreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a apreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.apreport.fetch(ctx.params);
  },

  /**
   * Count apreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.apreport.count(ctx.query);
  },

  /**
   * Create a/an apreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.apreport.add(ctx.request.body);
  },

  /**
   * Update a/an apreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.apreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an apreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.apreport.remove(ctx.params);
  }
};
