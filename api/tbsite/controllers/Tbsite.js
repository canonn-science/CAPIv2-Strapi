'use strict';

/**
 * Tbsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Tbsite`.
 */

module.exports = {

  /**
   * Retrieve tbsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Tbsite.count());
    if (ctx.query._q) {
      return strapi.services.tbsite.search(ctx.query);
    } else {
      return strapi.services.tbsite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a tbsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tbsite.fetch(ctx.params);
  },

  /**
   * Count tbsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.tbsite.count(ctx.query);
  },

  /**
   * Create a/an tbsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tbsite.add(ctx.request.body);
  },

  /**
   * Update a/an tbsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tbsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tbsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tbsite.remove(ctx.params);
  }
};
