'use strict';

/**
 * Excludecmdr.js controller
 *
 * @description: A set of functions called "actions" for managing `Excludecmdr`.
 */

module.exports = {

  /**
   * Retrieve excludecmdr records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.excludecmdr.search(ctx.query);
    } else {
      return strapi.services.excludecmdr.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a excludecmdr record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.excludecmdr.fetch(ctx.params);
  },

  /**
   * Count excludecmdr records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.excludecmdr.count(ctx.query);
  },

  /**
   * Create a/an excludecmdr record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.excludecmdr.add(ctx.request.body);
  },

  /**
   * Update a/an excludecmdr record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.excludecmdr.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an excludecmdr record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.excludecmdr.remove(ctx.params);
  },

  /**
   * Add relation to a/an excludecmdr record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.excludecmdr.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an excludecmdr record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.excludecmdr.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an excludecmdr record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.excludecmdr.removeRelation(ctx.params, ctx.request.body);
  }
};
