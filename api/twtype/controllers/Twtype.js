'use strict';

/**
 * Twtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Twtype`.
 */

module.exports = {

  /**
   * Retrieve twtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.twtype.search(ctx.query);
    } else {
      return strapi.services.twtype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a twtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.twtype.fetch(ctx.params);
  },

  /**
   * Count twtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.twtype.count(ctx.query);
  },

  /**
   * Create a/an twtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.twtype.add(ctx.request.body);
  },

  /**
   * Update a/an twtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.twtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an twtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.twtype.remove(ctx.params);
  }
};
