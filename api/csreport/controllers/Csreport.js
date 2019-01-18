'use strict';

/**
 * Csreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Csreport`.
 */

module.exports = {

  /**
   * Retrieve csreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.csreport.search(ctx.query);
    } else {
      return strapi.services.csreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a csreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.csreport.fetch(ctx.params);
  },

  /**
   * Count csreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.csreport.count(ctx.query);
  },

  /**
   * Create a/an csreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.csreport.add(ctx.request.body);
  },

  /**
   * Update a/an csreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.csreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an csreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.csreport.remove(ctx.params);
  }
};
