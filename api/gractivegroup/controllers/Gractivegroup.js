'use strict';

/**
 * Gractivegroup.js controller
 *
 * @description: A set of functions called "actions" for managing `Gractivegroup`.
 */

module.exports = {

  /**
   * Retrieve gractivegroup records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gractivegroup.search(ctx.query);
    } else {
      return strapi.services.gractivegroup.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gractivegroup record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gractivegroup.fetch(ctx.params);
  },

  /**
   * Count gractivegroup records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gractivegroup.count(ctx.query);
  },

  /**
   * Create a/an gractivegroup record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gractivegroup.add(ctx.request.body);
  },

  /**
   * Update a/an gractivegroup record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gractivegroup.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gractivegroup record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gractivegroup.remove(ctx.params);
  }
};
