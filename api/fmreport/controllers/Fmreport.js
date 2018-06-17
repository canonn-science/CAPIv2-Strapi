'use strict';

/**
 * Fmreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Fmreport`.
 */

module.exports = {

  /**
   * Retrieve fmreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.fmreport.fetchAll(ctx.query);
  },

  /**
   * Retrieve a fmreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fmreport.fetch(ctx.params);
  },

  /**
   * Count fmreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.fmreport.count(ctx.query);
  },

  /**
   * Create a/an fmreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fmreport.add(ctx.request.body);
  },

  /**
   * Update a/an fmreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fmreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fmreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fmreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an fmreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.fmreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an fmreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.fmreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an fmreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.fmreport.removeRelation(ctx.params, ctx.request.body);
  }
};
