'use strict';

/**
 * Genreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Genreport`.
 */

module.exports = {

  /**
   * Retrieve genreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Genreport.count());
    if (ctx.query._q) {
      return strapi.services.genreport.search(ctx.query);
    } else {
      return strapi.services.genreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a genreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.genreport.fetch(ctx.params);
  },

  /**
   * Count genreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.genreport.count(ctx.query, populate);
  },

  /**
   * Create a/an genreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.genreport.add(ctx.request.body);
  },

  /**
   * Update a/an genreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.genreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an genreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.genreport.remove(ctx.params);
  }
};
