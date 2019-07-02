'use strict';

/**
 * Gsreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Gsreport`.
 */

module.exports = {

  /**
   * Retrieve gsreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Gsreport.count());
    if (ctx.query._q) {
      return strapi.services.gsreport.search(ctx.query);
    } else {
      return strapi.services.gsreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a gsreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gsreport.fetch(ctx.params);
  },

  /**
   * Count gsreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.gsreport.count(ctx.query, populate);
  },

  /**
   * Create a/an gsreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gsreport.add(ctx.request.body);
  },

  /**
   * Update a/an gsreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gsreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gsreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gsreport.remove(ctx.params);
  }
};
