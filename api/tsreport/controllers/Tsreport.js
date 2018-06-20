'use strict';

/**
 * Tsreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Tsreport`.
 */

module.exports = {

  /**
   * Retrieve tsreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.tsreport.fetchAll(ctx.query);
  },

  /**
   * Retrieve a tsreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tsreport.fetch(ctx.params);
  },

  /**
   * Count tsreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.tsreport.count(ctx.query);
  },

  /**
   * Create a/an tsreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tsreport.add(ctx.request.body);
  },

  /**
   * Update a/an tsreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tsreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tsreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tsreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an tsreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.tsreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an tsreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.tsreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an tsreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.tsreport.removeRelation(ctx.params, ctx.request.body);
  }
};
