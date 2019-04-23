'use strict';

/**
 * Grreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Grreport`.
 */

module.exports = {

  /**
   * Retrieve grreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Grreport.count());
    if (ctx.query._q) {
      return strapi.services.grreport.search(ctx.query);
    } else {
      return strapi.services.grreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a grreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grreport.fetch(ctx.params);
  },

  /**
   * Count grreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.grreport.count(ctx.query, populate);
  },

  /**
   * Create a/an grreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grreport.add(ctx.request.body);
  },

  /**
   * Update a/an grreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grreport.remove(ctx.params);
  }
};
