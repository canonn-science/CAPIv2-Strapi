'use strict';

/**
 * Killreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Killreport`.
 */

module.exports = {

  /**
   * Retrieve killreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.killreport.search(ctx.query);
    } else {
      return strapi.services.killreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a killreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.killreport.fetch(ctx.params);
  },

  /**
   * Count killreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.killreport.count(ctx.query);
  },

  /**
   * Create a/an killreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.killreport.add(ctx.request.body);
  },

  /**
   * Update a/an killreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.killreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an killreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.killreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an killreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.killreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an killreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.killreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an killreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.killreport.removeRelation(ctx.params, ctx.request.body);
  }
};
