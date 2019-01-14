'use strict';

/**
 * Excludecodex.js controller
 *
 * @description: A set of functions called "actions" for managing `Excludecodex`.
 */

module.exports = {

  /**
   * Retrieve excludecodex records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.excludecodex.search(ctx.query);
    } else {
      return strapi.services.excludecodex.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a excludecodex record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.excludecodex.fetch(ctx.params);
  },

  /**
   * Count excludecodex records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.excludecodex.count(ctx.query);
  },

  /**
   * Create a/an excludecodex record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.excludecodex.add(ctx.request.body);
  },

  /**
   * Update a/an excludecodex record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.excludecodex.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an excludecodex record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.excludecodex.remove(ctx.params);
  },

  /**
   * Add relation to a/an excludecodex record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.excludecodex.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an excludecodex record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.excludecodex.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an excludecodex record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.excludecodex.removeRelation(ctx.params, ctx.request.body);
  }
};
