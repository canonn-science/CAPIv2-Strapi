'use strict';

/**
 * Gvreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Gvreport`.
 */

module.exports = {

  /**
   * Retrieve gvreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gvreport.search(ctx.query);
    } else {
      return strapi.services.gvreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gvreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gvreport.fetch(ctx.params);
  },

  /**
   * Count gvreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gvreport.count(ctx.query);
  },

  /**
   * Create a/an gvreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gvreport.add(ctx.request.body);
  },

  /**
   * Update a/an gvreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gvreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gvreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gvreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an gvreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gvreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gvreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gvreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gvreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gvreport.removeRelation(ctx.params, ctx.request.body);
  }
};
