'use strict';

/**
 * Nhssreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Nhssreport`.
 */

module.exports = {

  /**
   * Retrieve nhssreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.nhssreport.search(ctx.query);
    } else {
      return strapi.services.nhssreport.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a nhssreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.nhssreport.fetch(ctx.params);
  },

  /**
   * Count nhssreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.nhssreport.count(ctx.query);
  },

  /**
   * Create a/an nhssreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.nhssreport.add(ctx.request.body);
  },

  /**
   * Update a/an nhssreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.nhssreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an nhssreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.nhssreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an nhssreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.nhssreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an nhssreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.nhssreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an nhssreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.nhssreport.removeRelation(ctx.params, ctx.request.body);
  }
};
