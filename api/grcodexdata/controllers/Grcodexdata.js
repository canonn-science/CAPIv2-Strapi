'use strict';

/**
 * Grcodexdata.js controller
 *
 * @description: A set of functions called "actions" for managing `Grcodexdata`.
 */

module.exports = {

  /**
   * Retrieve grcodexdata records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Grcodexdata.count());
    if (ctx.query._q) {
      return strapi.services.grcodexdata.search(ctx.query);
    } else {
      return strapi.services.grcodexdata.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a grcodexdata record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grcodexdata.fetch(ctx.params);
  },

  /**
   * Count grcodexdata records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.grcodexdata.count(ctx.query, populate);
  },

  /**
   * Create a/an grcodexdata record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grcodexdata.add(ctx.request.body);
  },

  /**
   * Update a/an grcodexdata record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grcodexdata.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grcodexdata record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grcodexdata.remove(ctx.params);
  }
};
