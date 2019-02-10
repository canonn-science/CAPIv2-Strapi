'use strict';

/**
 * Fsslcreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Fsslcreport`.
 */

module.exports = {

  /**
   * Retrieve fsslcreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.fsslcreport.search(ctx.query);
    } else {
      return strapi.services.fsslcreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a fsslcreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fsslcreport.fetch(ctx.params);
  },

  /**
   * Count fsslcreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.fsslcreport.count(ctx.query);
  },

  /**
   * Create a/an fsslcreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fsslcreport.add(ctx.request.body);
  },

  /**
   * Update a/an fsslcreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fsslcreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fsslcreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fsslcreport.remove(ctx.params);
  }
};
