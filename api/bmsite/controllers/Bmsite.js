'use strict';

/**
 * Bmsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Bmsite`.
 */

module.exports = {

  /**
   * Retrieve bmsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Bmsite.count());
    if (ctx.query._q) {
      return strapi.services.bmsite.search(ctx.query);
    } else {
      return strapi.services.bmsite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a bmsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.bmsite.fetch(ctx.params);
  },

  /**
   * Count bmsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.bmsite.count(ctx.query);
  },

  /**
   * Create a/an bmsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.bmsite.add(ctx.request.body);
  },

  /**
   * Update a/an bmsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.bmsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an bmsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.bmsite.remove(ctx.params);
  }
};
