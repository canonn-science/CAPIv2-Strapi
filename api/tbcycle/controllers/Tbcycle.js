'use strict';

/**
 * Tbcycle.js controller
 *
 * @description: A set of functions called "actions" for managing `Tbcycle`.
 */

module.exports = {

  /**
   * Retrieve tbcycle records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Tbcycle.count());
    if (ctx.query._q) {
      return strapi.services.tbcycle.search(ctx.query);
    } else {
      return strapi.services.tbcycle.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a tbcycle record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tbcycle.fetch(ctx.params);
  },

  /**
   * Count tbcycle records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.tbcycle.count(ctx.query);
  },

  /**
   * Create a/an tbcycle record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tbcycle.add(ctx.request.body);
  },

  /**
   * Update a/an tbcycle record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tbcycle.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tbcycle record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tbcycle.remove(ctx.params);
  }
};
