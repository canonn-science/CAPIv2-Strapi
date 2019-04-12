'use strict';

/**
 * Lcfssreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Lcfssreport`.
 */

module.exports = {

  /**
   * Retrieve lcfssreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Lcfssreport.count());
    if (ctx.query._q) {
      return strapi.services.lcfssreport.search(ctx.query);
    } else {
      return strapi.services.lcfssreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a lcfssreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.lcfssreport.fetch(ctx.params);
  },

  /**
   * Count lcfssreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.lcfssreport.count(ctx.query);
  },

  /**
   * Create a/an lcfssreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.lcfssreport.add(ctx.request.body);
  },

  /**
   * Update a/an lcfssreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.lcfssreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an lcfssreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.lcfssreport.remove(ctx.params);
  }
};
