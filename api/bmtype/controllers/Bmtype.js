'use strict';

/**
 * Bmtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Bmtype`.
 */

module.exports = {

  /**
   * Retrieve bmtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.bmtype.search(ctx.query);
    } else {
      return strapi.services.bmtype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a bmtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.bmtype.fetch(ctx.params);
  },

  /**
   * Count bmtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.bmtype.count(ctx.query);
  },

  /**
   * Create a/an bmtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.bmtype.add(ctx.request.body);
  },

  /**
   * Update a/an bmtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.bmtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an bmtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.bmtype.remove(ctx.params);
  }
};
