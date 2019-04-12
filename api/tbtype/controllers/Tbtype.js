'use strict';

/**
 * Tbtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Tbtype`.
 */

module.exports = {

  /**
   * Retrieve tbtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Tbtype.count());
    if (ctx.query._q) {
      return strapi.services.tbtype.search(ctx.query);
    } else {
      return strapi.services.tbtype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a tbtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tbtype.fetch(ctx.params);
  },

  /**
   * Count tbtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.tbtype.count(ctx.query);
  },

  /**
   * Create a/an tbtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tbtype.add(ctx.request.body);
  },

  /**
   * Update a/an tbtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tbtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tbtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tbtype.remove(ctx.params);
  }
};
