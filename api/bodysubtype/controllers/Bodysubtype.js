'use strict';

/**
 * Bodysubtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Bodysubtype`.
 */

module.exports = {

  /**
   * Retrieve bodysubtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.bodysubtype.fetchAll(ctx.query);
  },

  /**
   * Retrieve a bodysubtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.bodysubtype.fetch(ctx.params);
  },

  /**
   * Count bodysubtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.bodysubtype.count(ctx.query);
  },

  /**
   * Create a/an bodysubtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.bodysubtype.add(ctx.request.body);
  },

  /**
   * Update a/an bodysubtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.bodysubtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an bodysubtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.bodysubtype.remove(ctx.params);
  },

  /**
   * Add relation to a/an bodysubtype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.bodysubtype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an bodysubtype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.bodysubtype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an bodysubtype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.bodysubtype.removeRelation(ctx.params, ctx.request.body);
  }
};
