'use strict';

/**
 * Bodymaterial.js controller
 *
 * @description: A set of functions called "actions" for managing `Bodymaterial`.
 */

module.exports = {

  /**
   * Retrieve bodymaterial records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.bodymaterial.search(ctx.query);
    } else {
      return strapi.services.bodymaterial.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a bodymaterial record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.bodymaterial.fetch(ctx.params);
  },

  /**
   * Count bodymaterial records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.bodymaterial.count(ctx.query);
  },

  /**
   * Create a/an bodymaterial record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.bodymaterial.add(ctx.request.body);
  },

  /**
   * Update a/an bodymaterial record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.bodymaterial.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an bodymaterial record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.bodymaterial.remove(ctx.params);
  },

  /**
   * Add relation to a/an bodymaterial record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.bodymaterial.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an bodymaterial record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.bodymaterial.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an bodymaterial record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.bodymaterial.removeRelation(ctx.params, ctx.request.body);
  }
};
