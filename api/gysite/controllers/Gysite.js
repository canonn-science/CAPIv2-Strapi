'use strict';

/**
 * Gysite.js controller
 *
 * @description: A set of functions called "actions" for managing `Gysite`.
 */

module.exports = {

  /**
   * Retrieve gysite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Gysite.count());
    if (ctx.query._q) {
      return strapi.services.gysite.search(ctx.query);
    } else {
      return strapi.services.gysite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gysite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gysite.fetch(ctx.params);
  },

  /**
   * Count gysite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gysite.count(ctx.query);
  },

  /**
   * Create a/an gysite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gysite.add(ctx.request.body);
  },

  /**
   * Update a/an gysite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gysite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gysite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gysite.remove(ctx.params);
  }
};
