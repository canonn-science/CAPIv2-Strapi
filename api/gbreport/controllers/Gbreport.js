'use strict';

/**
 * Gbreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Gbreport`.
 */

module.exports = {

  /**
   * Retrieve gbreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Gbreport.count());
    if (ctx.query._q) {
      return strapi.services.gbreport.search(ctx.query);
    } else {
      return strapi.services.gbreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a gbreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gbreport.fetch(ctx.params);
  },

  /**
   * Count gbreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.gbreport.count(ctx.query, populate);
  },

  /**
   * Create a/an gbreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gbreport.add(ctx.request.body);
  },

  /**
   * Update a/an gbreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gbreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gbreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gbreport.remove(ctx.params);
  }
};
