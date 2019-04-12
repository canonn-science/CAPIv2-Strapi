'use strict';

/**
 * Excludefss.js controller
 *
 * @description: A set of functions called "actions" for managing `Excludefss`.
 */

module.exports = {

  /**
   * Retrieve excludefss records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Excludefss.count());
    if (ctx.query._q) {
      return strapi.services.excludefss.search(ctx.query);
    } else {
      return strapi.services.excludefss.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a excludefss record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.excludefss.fetch(ctx.params);
  },

  /**
   * Count excludefss records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.excludefss.count(ctx.query);
  },

  /**
   * Create a/an excludefss record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.excludefss.add(ctx.request.body);
  },

  /**
   * Update a/an excludefss record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.excludefss.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an excludefss record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.excludefss.remove(ctx.params);
  }
};
