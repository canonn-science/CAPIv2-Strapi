'use strict';

/**
 * Gyreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Gyreport`.
 */

module.exports = {

  /**
   * Retrieve gyreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gyreport.search(ctx.query);
    } else {
      return strapi.services.gyreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gyreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gyreport.fetch(ctx.params);
  },

  /**
   * Count gyreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gyreport.count(ctx.query);
  },

  /**
   * Create a/an gyreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gyreport.add(ctx.request.body);
  },

  /**
   * Update a/an gyreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gyreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gyreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gyreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an gyreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gyreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gyreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gyreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gyreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gyreport.removeRelation(ctx.params, ctx.request.body);
  }
};
