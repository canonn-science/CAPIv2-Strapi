'use strict';

/**
 * Grtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Grtype`.
 */

module.exports = {

  /**
   * Retrieve grtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Grtype.count());
    if (ctx.query._q) {
      return strapi.services.grtype.search(ctx.query);
    } else {
      return strapi.services.grtype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a grtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grtype.fetch(ctx.params);
  },

  /**
   * Count grtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.grtype.count(ctx.query);
  },

  /**
   * Create a/an grtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grtype.add(ctx.request.body);
  },

  /**
   * Update a/an grtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grtype.remove(ctx.params);
  }
};
