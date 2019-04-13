'use strict';

/**
 * Gyreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Gyreport`.
 */

module.exports = {

  /**
   * Retrieve gyreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Gyreport.count());
    if (ctx.query._q) {
      return strapi.services.gyreport.search(ctx.query);
    } else {
      return strapi.services.gyreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gyreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gyreport.fetch(ctx.params);
  },

  /**
   * Count gyreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gyreport.count(ctx.query);
  },

  /**
   * Create a/an gyreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gyreport.add(ctx.request.body);
  },

  /**
   * Update a/an gyreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gyreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gyreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gyreport.remove(ctx.params);
  }
};
