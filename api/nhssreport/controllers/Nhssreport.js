'use strict';

/**
 * Nhssreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Nhssreport`.
 */

module.exports = {

  /**
   * Retrieve nhssreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Nhssreport.count());
    if (ctx.query._q) {
      return strapi.services.nhssreport.search(ctx.query);
    } else {
      return strapi.services.nhssreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a nhssreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.nhssreport.fetch(ctx.params);
  },

  /**
   * Count nhssreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.nhssreport.count(ctx.query, populate);
  },

  /**
   * Create a/an nhssreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.nhssreport.add(ctx.request.body);
  },

  /**
   * Update a/an nhssreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.nhssreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an nhssreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.nhssreport.remove(ctx.params);
  }
};
