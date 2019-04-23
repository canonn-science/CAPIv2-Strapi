'use strict';

/**
 * Apiupdate.js controller
 *
 * @description: A set of functions called "actions" for managing `Apiupdate`.
 */

module.exports = {

  /**
   * Retrieve apiupdate records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Apiupdate.count());
    if (ctx.query._q) {
      return strapi.services.apiupdate.search(ctx.query);
    } else {
      return strapi.services.apiupdate.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a apiupdate record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.apiupdate.fetch(ctx.params);
  },

  /**
   * Count apiupdate records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.apiupdate.count(ctx.query, populate);
  },

  /**
   * Create a/an apiupdate record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.apiupdate.add(ctx.request.body);
  },

  /**
   * Update a/an apiupdate record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.apiupdate.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an apiupdate record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.apiupdate.remove(ctx.params);
  }
};
