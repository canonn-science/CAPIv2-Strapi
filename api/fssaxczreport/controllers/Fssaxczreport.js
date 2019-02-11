'use strict';

/**
 * Fssaxczreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Fssaxczreport`.
 */

module.exports = {

  /**
   * Retrieve fssaxczreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.fssaxczreport.search(ctx.query);
    } else {
      return strapi.services.fssaxczreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a fssaxczreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fssaxczreport.fetch(ctx.params);
  },

  /**
   * Count fssaxczreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.fssaxczreport.count(ctx.query);
  },

  /**
   * Create a/an fssaxczreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fssaxczreport.add(ctx.request.body);
  },

  /**
   * Update a/an fssaxczreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fssaxczreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fssaxczreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fssaxczreport.remove(ctx.params);
  }
};
