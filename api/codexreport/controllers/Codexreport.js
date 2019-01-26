'use strict';

/**
 * Codexreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Codexreport`.
 */

module.exports = {

  /**
   * Retrieve codexreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.codexreport.search(ctx.query);
    } else {
      return strapi.services.codexreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a codexreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.codexreport.fetch(ctx.params);
  },

  /**
   * Count codexreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.codexreport.count(ctx.query);
  },

  /**
   * Create a/an codexreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.codexreport.add(ctx.request.body);
  },

  /**
   * Update a/an codexreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.codexreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an codexreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.codexreport.remove(ctx.params);
  }
};
