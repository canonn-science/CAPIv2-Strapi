'use strict';

/**
 * Ussreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Ussreport`.
 */

module.exports = {

  /**
   * Retrieve ussreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.ussreport.search(ctx.query);
    } else {
      return strapi.services.ussreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a ussreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.ussreport.fetch(ctx.params);
  },

  /**
   * Count ussreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.ussreport.count(ctx.query);
  },

  /**
   * Create a/an ussreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.ussreport.add(ctx.request.body);
  },

  /**
   * Update a/an ussreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.ussreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an ussreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.ussreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an ussreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.ussreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an ussreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.ussreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an ussreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.ussreport.removeRelation(ctx.params, ctx.request.body);
  }
};
