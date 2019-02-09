'use strict';

/**
 * Fssreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Fssreport`.
 */

module.exports = {

  /**
   * Retrieve fssreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.fssreport.search(ctx.query);
    } else {
      return strapi.services.fssreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a fssreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    if (!ctx.params._id.match(/^[0-9a-fA-F]{24}$/)) {
      return ctx.notFound();
    }

    return strapi.services.fssreport.fetch(ctx.params);
  },

  /**
   * Count fssreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.fssreport.count(ctx.query);
  },

  /**
   * Create a/an fssreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fssreport.add(ctx.request.body);
  },

  /**
   * Update a/an fssreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fssreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fssreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fssreport.remove(ctx.params);
  }
};
