'use strict';

/**
 * Gssite.js controller
 *
 * @description: A set of functions called "actions" for managing `Gssite`.
 */

module.exports = {

  /**
   * Retrieve gssite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Gssite.count());
    if (ctx.query._q) {
      return strapi.services.gssite.search(ctx.query);
    } else {
      return strapi.services.gssite.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a gssite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gssite.fetch(ctx.params);
  },

  /**
   * Count gssite records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.gssite.count(ctx.query, populate);
  },

  /**
   * Create a/an gssite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gssite.add(ctx.request.body);
  },

  /**
   * Update a/an gssite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gssite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gssite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gssite.remove(ctx.params);
  }
};
