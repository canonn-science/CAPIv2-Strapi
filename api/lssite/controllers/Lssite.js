'use strict';

/**
 * Lssite.js controller
 *
 * @description: A set of functions called "actions" for managing `Lssite`.
 */

module.exports = {

  /**
   * Retrieve lssite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.lssite.search(ctx.query);
    } else {
      return strapi.services.lssite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a lssite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.lssite.fetch(ctx.params);
  },

  /**
   * Count lssite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.lssite.count(ctx.query);
  },

  /**
   * Create a/an lssite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.lssite.add(ctx.request.body);
  },

  /**
   * Update a/an lssite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.lssite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an lssite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.lssite.remove(ctx.params);
  }
};
