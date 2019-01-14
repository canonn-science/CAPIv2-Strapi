'use strict';

/**
 * Excludeclient.js controller
 *
 * @description: A set of functions called "actions" for managing `Excludeclient`.
 */

module.exports = {

  /**
   * Retrieve excludeclient records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.excludeclient.search(ctx.query);
    } else {
      return strapi.services.excludeclient.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a excludeclient record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.excludeclient.fetch(ctx.params);
  },

  /**
   * Count excludeclient records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.excludeclient.count(ctx.query);
  },

  /**
   * Create a/an excludeclient record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.excludeclient.add(ctx.request.body);
  },

  /**
   * Update a/an excludeclient record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.excludeclient.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an excludeclient record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.excludeclient.remove(ctx.params);
  },

  /**
   * Add relation to a/an excludeclient record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.excludeclient.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an excludeclient record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.excludeclient.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an excludeclient record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.excludeclient.removeRelation(ctx.params, ctx.request.body);
  }
};
