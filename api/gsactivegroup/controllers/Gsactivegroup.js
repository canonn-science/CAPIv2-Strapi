'use strict';

/**
 * Gsactivegroup.js controller
 *
 * @description: A set of functions called "actions" for managing `Gsactivegroup`.
 */

module.exports = {

  /**
   * Retrieve gsactivegroup records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Gsactivegroup.count());
    if (ctx.query._q) {
      return strapi.services.gsactivegroup.search(ctx.query);
    } else {
      return strapi.services.gsactivegroup.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gsactivegroup record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gsactivegroup.fetch(ctx.params);
  },

  /**
   * Count gsactivegroup records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gsactivegroup.count(ctx.query);
  },

  /**
   * Create a/an gsactivegroup record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gsactivegroup.add(ctx.request.body);
  },

  /**
   * Update a/an gsactivegroup record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gsactivegroup.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gsactivegroup record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gsactivegroup.remove(ctx.params);
  }
};
