'use strict';

/**
 * Btreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Btreport`.
 */

module.exports = {

  /**
   * Retrieve btreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.btreport.search(ctx.query);
    } else {
      return strapi.services.btreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a btreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.btreport.fetch(ctx.params);
  },

  /**
   * Count btreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.btreport.count(ctx.query);
  },

  /**
   * Create a/an btreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.btreport.add(ctx.request.body);
  },

  /**
   * Update a/an btreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.btreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an btreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.btreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an btreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.btreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an btreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.btreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an btreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.btreport.removeRelation(ctx.params, ctx.request.body);
  }
};
