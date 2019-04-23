'use strict';

/**
 * Cssite.js controller
 *
 * @description: A set of functions called "actions" for managing `Cssite`.
 */

module.exports = {

  /**
   * Retrieve cssite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Cssite.count());
    if (ctx.query._q) {
      return strapi.services.cssite.search(ctx.query);
    } else {
      return strapi.services.cssite.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a cssite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.cssite.fetch(ctx.params);
  },

  /**
   * Count cssite records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.cssite.count(ctx.query, populate);
  },

  /**
   * Create a/an cssite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.cssite.add(ctx.request.body);
  },

  /**
   * Update a/an cssite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.cssite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an cssite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.cssite.remove(ctx.params);
  }
};
