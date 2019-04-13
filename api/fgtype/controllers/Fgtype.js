'use strict';

/**
 * Fgtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Fgtype`.
 */

module.exports = {

  /**
   * Retrieve fgtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Fgtype.count());
    if (ctx.query._q) {
      return strapi.services.fgtype.search(ctx.query);
    } else {
      return strapi.services.fgtype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a fgtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fgtype.fetch(ctx.params);
  },

  /**
   * Count fgtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.fgtype.count(ctx.query);
  },

  /**
   * Create a/an fgtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fgtype.add(ctx.request.body);
  },

  /**
   * Update a/an fgtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fgtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fgtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fgtype.remove(ctx.params);
  }
};
