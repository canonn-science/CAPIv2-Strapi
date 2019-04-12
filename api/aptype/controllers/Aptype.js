'use strict';

/**
 * Aptype.js controller
 *
 * @description: A set of functions called "actions" for managing `Aptype`.
 */

module.exports = {

  /**
   * Retrieve aptype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Aptype.count());
    if (ctx.query._q) {
      return strapi.services.aptype.search(ctx.query);
    } else {
      return strapi.services.aptype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a aptype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.aptype.fetch(ctx.params);
  },

  /**
   * Count aptype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.aptype.count(ctx.query);
  },

  /**
   * Create a/an aptype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.aptype.add(ctx.request.body);
  },

  /**
   * Update a/an aptype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.aptype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an aptype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.aptype.remove(ctx.params);
  }
};
