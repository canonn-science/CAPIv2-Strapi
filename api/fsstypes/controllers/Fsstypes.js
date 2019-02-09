'use strict';

/**
 * Fsstypes.js controller
 *
 * @description: A set of functions called "actions" for managing `Fsstypes`.
 */

module.exports = {

  /**
   * Retrieve fsstypes records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.fsstypes.search(ctx.query);
    } else {
      return strapi.services.fsstypes.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a fsstypes record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    if (!ctx.params._id.match(/^[0-9a-fA-F]{24}$/)) {
      return ctx.notFound();
    }

    return strapi.services.fsstypes.fetch(ctx.params);
  },

  /**
   * Count fsstypes records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.fsstypes.count(ctx.query);
  },

  /**
   * Create a/an fsstypes record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fsstypes.add(ctx.request.body);
  },

  /**
   * Update a/an fsstypes record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fsstypes.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fsstypes record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fsstypes.remove(ctx.params);
  }
};
