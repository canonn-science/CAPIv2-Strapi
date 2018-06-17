'use strict';

/**
 * Bmreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Bmreport`.
 */

module.exports = {

  /**
   * Retrieve bmreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.bmreport.fetchAll(ctx.query);
  },

  /**
   * Retrieve a bmreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.bmreport.fetch(ctx.params);
  },

  /**
   * Count bmreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.bmreport.count(ctx.query);
  },

  /**
   * Create a/an bmreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.bmreport.add(ctx.request.body);
  },

  /**
   * Update a/an bmreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.bmreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an bmreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.bmreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an bmreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.bmreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an bmreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.bmreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an bmreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.bmreport.removeRelation(ctx.params, ctx.request.body);
  }
};
