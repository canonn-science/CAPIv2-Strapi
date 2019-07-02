'use strict';

/**
 * Gsobeliskgroup.js controller
 *
 * @description: A set of functions called "actions" for managing `Gsobeliskgroup`.
 */

module.exports = {

  /**
   * Retrieve gsobeliskgroup records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Gsobeliskgroup.count());
    if (ctx.query._q) {
      return strapi.services.gsobeliskgroup.search(ctx.query);
    } else {
      return strapi.services.gsobeliskgroup.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a gsobeliskgroup record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gsobeliskgroup.fetch(ctx.params);
  },

  /**
   * Count gsobeliskgroup records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.gsobeliskgroup.count(ctx.query, populate);
  },

  /**
   * Create a/an gsobeliskgroup record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gsobeliskgroup.add(ctx.request.body);
  },

  /**
   * Update a/an gsobeliskgroup record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gsobeliskgroup.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gsobeliskgroup record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gsobeliskgroup.remove(ctx.params);
  }
};
