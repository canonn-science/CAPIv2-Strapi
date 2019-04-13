'use strict';

/**
 * Fgsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Fgsite`.
 */

module.exports = {

  /**
   * Retrieve fgsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Fgsite.count());
    if (ctx.query._q) {
      return strapi.services.fgsite.search(ctx.query);
    } else {
      return strapi.services.fgsite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a fgsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fgsite.fetch(ctx.params);
  },

  /**
   * Count fgsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.fgsite.count(ctx.query);
  },

  /**
   * Create a/an fgsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fgsite.add(ctx.request.body);
  },

  /**
   * Update a/an fgsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fgsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fgsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fgsite.remove(ctx.params);
  }
};
