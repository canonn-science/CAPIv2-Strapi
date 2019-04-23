'use strict';

/**
 * Clientreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Clientreport`.
 */

module.exports = {

  /**
   * Retrieve clientreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Clientreport.count());
    if (ctx.query._q) {
      return strapi.services.clientreport.search(ctx.query);
    } else {
      return strapi.services.clientreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a clientreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.clientreport.fetch(ctx.params);
  },

  /**
   * Count clientreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.clientreport.count(ctx.query, populate);
  },

  /**
   * Create a/an clientreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.clientreport.add(ctx.request.body);
  },

  /**
   * Update a/an clientreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.clientreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an clientreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.clientreport.remove(ctx.params);
  }
};
