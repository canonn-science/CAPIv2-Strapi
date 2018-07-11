'use strict';

/**
 * Lsreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Lsreport`.
 */

module.exports = {

  /**
   * Retrieve lsreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.lsreport.search(ctx.query);
    } else {
      return strapi.services.lsreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a lsreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.lsreport.fetch(ctx.params);
  },

  /**
   * Count lsreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.lsreport.count(ctx.query);
  },

  /**
   * Create a/an lsreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.lsreport.add(ctx.request.body);
  },

  /**
   * Update a/an lsreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.lsreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an lsreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.lsreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an lsreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.lsreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an lsreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.lsreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an lsreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.lsreport.removeRelation(ctx.params, ctx.request.body);
  }
};
