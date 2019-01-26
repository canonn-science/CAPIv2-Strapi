'use strict';

/**
 * Twreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Twreport`.
 */

module.exports = {

  /**
   * Retrieve twreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.twreport.search(ctx.query);
    } else {
      return strapi.services.twreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a twreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.twreport.fetch(ctx.params);
  },

  /**
   * Count twreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.twreport.count(ctx.query);
  },

  /**
   * Create a/an twreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.twreport.add(ctx.request.body);
  },

  /**
   * Update a/an twreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.twreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an twreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.twreport.remove(ctx.params);
  }
};
