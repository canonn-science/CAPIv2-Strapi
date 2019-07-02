'use strict';

/**
 * Cstype.js controller
 *
 * @description: A set of functions called "actions" for managing `Cstype`.
 */

module.exports = {

  /**
   * Retrieve cstype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Cstype.count());
    if (ctx.query._q) {
      return strapi.services.cstype.search(ctx.query);
    } else {
      return strapi.services.cstype.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a cstype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.cstype.fetch(ctx.params);
  },

  /**
   * Count cstype records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.cstype.count(ctx.query, populate);
  },

  /**
   * Create a/an cstype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.cstype.add(ctx.request.body);
  },

  /**
   * Update a/an cstype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.cstype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an cstype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.cstype.remove(ctx.params);
  }
};
