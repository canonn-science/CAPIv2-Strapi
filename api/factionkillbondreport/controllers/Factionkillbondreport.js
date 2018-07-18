'use strict';

/**
 * Factionkillbondreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Factionkillbondreport`.
 */

module.exports = {

  /**
   * Retrieve factionkillbondreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.factionkillbondreport.search(ctx.query);
    } else {
      return strapi.services.factionkillbondreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a factionkillbondreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.factionkillbondreport.fetch(ctx.params);
  },

  /**
   * Count factionkillbondreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.factionkillbondreport.count(ctx.query);
  },

  /**
   * Create a/an factionkillbondreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.factionkillbondreport.add(ctx.request.body);
  },

  /**
   * Update a/an factionkillbondreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.factionkillbondreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an factionkillbondreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.factionkillbondreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an factionkillbondreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.factionkillbondreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an factionkillbondreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.factionkillbondreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an factionkillbondreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.factionkillbondreport.removeRelation(ctx.params, ctx.request.body);
  }
};
