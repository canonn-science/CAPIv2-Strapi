'use strict';

/**
 * Gsreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Gsreport`.
 */

module.exports = {

  /**
   * Retrieve gsreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.gsreport.fetchAll(ctx.query);
  },

  /**
   * Retrieve a gsreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gsreport.fetch(ctx.params);
  },

  /**
   * Count gsreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gsreport.count(ctx.query);
  },

  /**
   * Create a/an gsreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gsreport.add(ctx.request.body);
  },

  /**
   * Update a/an gsreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gsreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gsreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gsreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an gsreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gsreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gsreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gsreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gsreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gsreport.removeRelation(ctx.params, ctx.request.body);
  }
};
