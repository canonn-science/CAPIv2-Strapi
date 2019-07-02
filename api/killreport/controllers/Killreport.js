'use strict';

/**
 * Killreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Killreport`.
 */

module.exports = {

  /**
   * Retrieve killreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Killreport.count());
    if (ctx.query._q) {
      return strapi.services.killreport.search(ctx.query);
    } else {
      return strapi.services.killreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a killreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.killreport.fetch(ctx.params);
  },

  /**
   * Count killreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.killreport.count(ctx.query, populate);
  },

  /**
   * Create a/an killreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.killreport.add(ctx.request.body);
  },

  /**
   * Update a/an killreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.killreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an killreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.killreport.remove(ctx.params);
  }
};
