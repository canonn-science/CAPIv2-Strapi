'use strict';

/**
 * Eventreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Eventreport`.
 */

module.exports = {

  /**
   * Retrieve eventreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.eventreport.search(ctx.query);
    } else {
      return strapi.services.eventreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a eventreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.eventreport.fetch(ctx.params);
  },

  /**
   * Count eventreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.eventreport.count(ctx.query);
  },

  /**
   * Create a/an eventreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.eventreport.add(ctx.request.body);
  },

  /**
   * Update a/an eventreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.eventreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an eventreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.eventreport.remove(ctx.params);
  }
};
