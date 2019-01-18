'use strict';

/**
 * Msschedule.js controller
 *
 * @description: A set of functions called "actions" for managing `Msschedule`.
 */

module.exports = {

  /**
   * Retrieve msschedule records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.msschedule.search(ctx.query);
    } else {
      return strapi.services.msschedule.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a msschedule record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.msschedule.fetch(ctx.params);
  },

  /**
   * Count msschedule records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.msschedule.count(ctx.query);
  },

  /**
   * Create a/an msschedule record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.msschedule.add(ctx.request.body);
  },

  /**
   * Update a/an msschedule record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.msschedule.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an msschedule record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.msschedule.remove(ctx.params);
  }
};
