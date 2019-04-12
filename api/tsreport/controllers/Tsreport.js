'use strict';

/**
 * Tsreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Tsreport`.
 */

module.exports = {

  /**
   * Retrieve tsreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Tsreport.count());
    if (ctx.query._q) {
      return strapi.services.tsreport.search(ctx.query);
    } else {
      return strapi.services.tsreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a tsreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tsreport.fetch(ctx.params);
  },

  /**
   * Count tsreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.tsreport.count(ctx.query);
  },

  /**
   * Create a/an tsreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tsreport.add(ctx.request.body);
  },

  /**
   * Update a/an tsreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tsreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tsreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tsreport.remove(ctx.params);
  }
};
