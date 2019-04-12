'use strict';

/**
 * Gvreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Gvreport`.
 */

module.exports = {

  /**
   * Retrieve gvreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Gvreport.count());
    if (ctx.query._q) {
      return strapi.services.gvreport.search(ctx.query);
    } else {
      return strapi.services.gvreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gvreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gvreport.fetch(ctx.params);
  },

  /**
   * Count gvreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gvreport.count(ctx.query);
  },

  /**
   * Create a/an gvreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gvreport.add(ctx.request.body);
  },

  /**
   * Update a/an gvreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gvreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gvreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gvreport.remove(ctx.params);
  }
};
