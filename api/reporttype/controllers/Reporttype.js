'use strict';

/**
 * Reporttype.js controller
 *
 * @description: A set of functions called "actions" for managing `Reporttype`.
 */

module.exports = {

  /**
   * Retrieve reporttype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Reporttype.count());
    if (ctx.query._q) {
      return strapi.services.reporttype.search(ctx.query);
    } else {
      return strapi.services.reporttype.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a reporttype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.reporttype.fetch(ctx.params);
  },

  /**
   * Count reporttype records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.reporttype.count(ctx.query, populate);
  },

  /**
   * Create a/an reporttype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.reporttype.add(ctx.request.body);
  },

  /**
   * Update a/an reporttype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.reporttype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an reporttype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.reporttype.remove(ctx.params);
  }
};
