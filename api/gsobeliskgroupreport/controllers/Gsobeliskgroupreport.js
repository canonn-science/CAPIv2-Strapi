'use strict';

/**
 * Gsobeliskgroupreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Gsobeliskgroupreport`.
 */

module.exports = {

  /**
   * Retrieve gsobeliskgroupreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gsobeliskgroupreport.search(ctx.query);
    } else {
      return strapi.services.gsobeliskgroupreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gsobeliskgroupreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gsobeliskgroupreport.fetch(ctx.params);
  },

  /**
   * Count gsobeliskgroupreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gsobeliskgroupreport.count(ctx.query);
  },

  /**
   * Create a/an gsobeliskgroupreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gsobeliskgroupreport.add(ctx.request.body);
  },

  /**
   * Update a/an gsobeliskgroupreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gsobeliskgroupreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gsobeliskgroupreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gsobeliskgroupreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an gsobeliskgroupreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gsobeliskgroupreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gsobeliskgroupreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gsobeliskgroupreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gsobeliskgroupreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gsobeliskgroupreport.removeRelation(ctx.params, ctx.request.body);
  }
};
