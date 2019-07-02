'use strict';

/**
 * Body.js controller
 *
 * @description: A set of functions called "actions" for managing `Body`.
 */

module.exports = {

  /**
   * Retrieve body records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Body.count());
    if (ctx.query._q) {
      return strapi.services.body.search(ctx.query);
    } else {
      return strapi.services.body.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a body record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.body.fetch(ctx.params);
  },

  /**
   * Count body records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.body.count(ctx.query, populate);
  },

  /**
   * Create a/an body record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.body.add(ctx.request.body);
  },

  /**
   * Update a/an body record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.body.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an body record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.body.remove(ctx.params);
  }
};
