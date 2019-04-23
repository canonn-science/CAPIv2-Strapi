'use strict';

/**
 * Fmsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Fmsite`.
 */

module.exports = {

  /**
   * Retrieve fmsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Fmsite.count());
    if (ctx.query._q) {
      return strapi.services.fmsite.search(ctx.query);
    } else {
      return strapi.services.fmsite.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a fmsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fmsite.fetch(ctx.params);
  },

  /**
   * Count fmsite records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.fmsite.count(ctx.query, populate);
  },

  /**
   * Create a/an fmsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fmsite.add(ctx.request.body);
  },

  /**
   * Update a/an fmsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fmsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fmsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fmsite.remove(ctx.params);
  }
};
