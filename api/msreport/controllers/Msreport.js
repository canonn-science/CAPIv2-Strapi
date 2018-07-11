'use strict';

/**
 * Msreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Msreport`.
 */

module.exports = {

  /**
   * Retrieve msreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.msreport.search(ctx.query);
    } else {
      return strapi.services.msreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a msreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.msreport.fetch(ctx.params);
  },

  /**
   * Count msreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.msreport.count(ctx.query);
  },

  /**
   * Create a/an msreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.msreport.add(ctx.request.body);
  },

  /**
   * Update a/an msreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.msreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an msreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.msreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an msreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.msreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an msreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.msreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an msreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.msreport.removeRelation(ctx.params, ctx.request.body);
  }
};
