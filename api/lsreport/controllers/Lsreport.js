'use strict';

/**
 * Lsreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Lsreport`.
 */

module.exports = {

  /**
   * Retrieve lsreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Lsreport.count());
    if (ctx.query._q) {
      return strapi.services.lsreport.search(ctx.query);
    } else {
      return strapi.services.lsreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a lsreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.lsreport.fetch(ctx.params);
  },

  /**
   * Count lsreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.lsreport.count(ctx.query, populate);
  },

  /**
   * Create a/an lsreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.lsreport.add(ctx.request.body);
  },

  /**
   * Update a/an lsreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.lsreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an lsreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.lsreport.remove(ctx.params);
  }
};
