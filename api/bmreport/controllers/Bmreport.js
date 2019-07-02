'use strict';

/**
 * Bmreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Bmreport`.
 */

module.exports = {

  /**
   * Retrieve bmreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Bmreport.count());
    if (ctx.query._q) {
      return strapi.services.bmreport.search(ctx.query);
    } else {
      return strapi.services.bmreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a bmreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.bmreport.fetch(ctx.params);
  },

  /**
   * Count bmreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.bmreport.count(ctx.query, populate);
  },

  /**
   * Create a/an bmreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.bmreport.add(ctx.request.body);
  },

  /**
   * Update a/an bmreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.bmreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an bmreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.bmreport.remove(ctx.params);
  }
};
