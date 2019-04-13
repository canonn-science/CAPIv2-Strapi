'use strict';

/**
 * Gytype.js controller
 *
 * @description: A set of functions called "actions" for managing `Gytype`.
 */

module.exports = {

  /**
   * Retrieve gytype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Gytype.count());
    if (ctx.query._q) {
      return strapi.services.gytype.search(ctx.query);
    } else {
      return strapi.services.gytype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gytype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gytype.fetch(ctx.params);
  },

  /**
   * Count gytype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gytype.count(ctx.query);
  },

  /**
   * Create a/an gytype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gytype.add(ctx.request.body);
  },

  /**
   * Update a/an gytype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gytype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gytype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gytype.remove(ctx.params);
  }
};
