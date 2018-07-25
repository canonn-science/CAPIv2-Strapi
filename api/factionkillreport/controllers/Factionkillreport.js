'use strict';

/**
 * Factionkillreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Factionkillreport`.
 */

module.exports = {

  /**
   * Retrieve factionkillreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.factionkillreport.search(ctx.query);
    } else {
      return strapi.services.factionkillreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a factionkillreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.factionkillreport.fetch(ctx.params);
  },

  /**
   * Count factionkillreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.factionkillreport.count(ctx.query);
  },

  /**
   * Create a/an factionkillreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.factionkillreport.add(ctx.request.body);
  },

  /**
   * Update a/an factionkillreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.factionkillreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an factionkillreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.factionkillreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an factionkillreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.factionkillreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an factionkillreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.factionkillreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an factionkillreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.factionkillreport.removeRelation(ctx.params, ctx.request.body);
  }
};
