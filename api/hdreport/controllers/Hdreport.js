'use strict';

/**
 * Hdreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Hdreport`.
 */

module.exports = {

  /**
   * Retrieve hdreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.hdreport.search(ctx.query);
    } else {
      return strapi.services.hdreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a hdreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.hdreport.fetch(ctx.params);
  },

  /**
   * Count hdreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.hdreport.count(ctx.query);
  },

  /**
   * Create a/an hdreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.hdreport.add(ctx.request.body);
  },

  /**
   * Update a/an hdreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.hdreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an hdreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.hdreport.remove(ctx.params);
  }
};
