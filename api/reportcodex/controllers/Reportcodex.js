'use strict';

/**
 * Reportcodex.js controller
 *
 * @description: A set of functions called "actions" for managing `Reportcodex`.
 */

module.exports = {

  /**
   * Retrieve reportcodex records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Reportcodex.count());
    if (ctx.query._q) {
      return strapi.services.reportcodex.search(ctx.query);
    } else {
      return strapi.services.reportcodex.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a reportcodex record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.reportcodex.fetch(ctx.params);
  },

  /**
   * Count reportcodex records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.reportcodex.count(ctx.query, populate);
  },

  /**
   * Create a/an reportcodex record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.reportcodex.add(ctx.request.body);
  },

  /**
   * Update a/an reportcodex record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.reportcodex.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an reportcodex record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.reportcodex.remove(ctx.params);
  }
};
