'use strict';

/**
 * Fmtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Fmtype`.
 */

module.exports = {

  /**
   * Retrieve fmtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.fmtype.fetchAll(ctx.query);
  },

  /**
   * Retrieve a fmtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fmtype.fetch(ctx.params);
  },

  /**
   * Count fmtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.fmtype.count(ctx.query);
  },

  /**
   * Create a/an fmtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fmtype.add(ctx.request.body);
  },

  /**
   * Update a/an fmtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fmtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fmtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fmtype.remove(ctx.params);
  },

  /**
   * Add relation to a/an fmtype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.fmtype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an fmtype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.fmtype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an fmtype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.fmtype.removeRelation(ctx.params, ctx.request.body);
  }
};
