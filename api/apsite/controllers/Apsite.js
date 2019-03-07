'use strict';

/**
 * Apsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Apsite`.
 */

module.exports = {

  /**
   * Retrieve apsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.apsite.search(ctx.query);
    } else {
      return strapi.services.apsite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a apsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.apsite.fetch(ctx.params);
  },

  /**
   * Count apsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.apsite.count(ctx.query);
  },

  /**
   * Create a/an apsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.apsite.add(ctx.request.body);
  },

  /**
   * Update a/an apsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.apsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an apsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.apsite.remove(ctx.params);
  }
};
