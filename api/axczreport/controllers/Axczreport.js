'use strict';

/**
 * Axczreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Axczreport`.
 */

module.exports = {

  /**
   * Retrieve axczreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.axczreport.search(ctx.query);
    } else {
      return strapi.services.axczreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a axczreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.axczreport.fetch(ctx.params);
  },

  /**
   * Count axczreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.axczreport.count(ctx.query);
  },

  /**
   * Create a/an axczreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.axczreport.add(ctx.request.body);
  },

  /**
   * Update a/an axczreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.axczreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an axczreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.axczreport.remove(ctx.params);
  }
};
