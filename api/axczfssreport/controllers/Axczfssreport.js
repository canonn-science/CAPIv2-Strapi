'use strict';

/**
 * Axczfssreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Axczfssreport`.
 */

module.exports = {

  /**
   * Retrieve axczfssreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Axczfssreport.count());
    if (ctx.query._q) {
      return strapi.services.axczfssreport.search(ctx.query);
    } else {
      return strapi.services.axczfssreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a axczfssreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.axczfssreport.fetch(ctx.params);
  },

  /**
   * Count axczfssreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.axczfssreport.count(ctx.query, populate);
  },

  /**
   * Create a/an axczfssreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.axczfssreport.add(ctx.request.body);
  },

  /**
   * Update a/an axczfssreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.axczfssreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an axczfssreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.axczfssreport.remove(ctx.params);
  }
};
