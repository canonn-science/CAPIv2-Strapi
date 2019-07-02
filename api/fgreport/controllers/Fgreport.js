'use strict';

/**
 * Fgreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Fgreport`.
 */

module.exports = {

  /**
   * Retrieve fgreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Fgreport.count());
    if (ctx.query._q) {
      return strapi.services.fgreport.search(ctx.query);
    } else {
      return strapi.services.fgreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a fgreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fgreport.fetch(ctx.params);
  },

  /**
   * Count fgreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.fgreport.count(ctx.query, populate);
  },

  /**
   * Create a/an fgreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fgreport.add(ctx.request.body);
  },

  /**
   * Update a/an fgreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fgreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fgreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fgreport.remove(ctx.params);
  }
};
