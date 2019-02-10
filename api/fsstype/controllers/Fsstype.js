'use strict';

/**
 * Fsstype.js controller
 *
 * @description: A set of functions called "actions" for managing `Fsstype`.
 */

module.exports = {

  /**
   * Retrieve fsstype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.fsstype.search(ctx.query);
    } else {
      return strapi.services.fsstype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a fsstype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fsstype.fetch(ctx.params);
  },

  /**
   * Count fsstype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.fsstype.count(ctx.query);
  },

  /**
   * Create a/an fsstype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fsstype.add(ctx.request.body);
  },

  /**
   * Update a/an fsstype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fsstype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fsstype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fsstype.remove(ctx.params);
  }
};
