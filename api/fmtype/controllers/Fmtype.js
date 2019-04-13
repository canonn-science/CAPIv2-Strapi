'use strict';

/**
 * Fmtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Fmtype`.
 */

module.exports = {

  /**
   * Retrieve fmtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Fmtype.count());
    if (ctx.query._q) {
      return strapi.services.fmtype.search(ctx.query);
    } else {
      return strapi.services.fmtype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a fmtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fmtype.fetch(ctx.params);
  },

  /**
   * Count fmtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.fmtype.count(ctx.query);
  },

  /**
   * Create a/an fmtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fmtype.add(ctx.request.body);
  },

  /**
   * Update a/an fmtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fmtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fmtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fmtype.remove(ctx.params);
  }
};
