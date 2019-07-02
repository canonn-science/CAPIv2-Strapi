'use strict';

/**
 * Materialreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Materialreport`.
 */

module.exports = {

  /**
   * Retrieve materialreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.materialreport.search(ctx.query);
    } else {
      return strapi.services.materialreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a materialreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.materialreport.fetch(ctx.params);
  },

  /**
   * Count materialreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.materialreport.count(ctx.query, populate);
  },

  /**
   * Create a/an materialreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.materialreport.add(ctx.request.body);
  },

  /**
   * Update a/an materialreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.materialreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an materialreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.materialreport.remove(ctx.params);
  }
};
