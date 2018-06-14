'use strict';

/**
 * Gractivegroup.js controller
 *
 * @description: A set of functions called "actions" for managing `Gractivegroup`.
 */

module.exports = {

  /**
   * Retrieve gractivegroup records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.gractivegroup.fetchAll(ctx.query);
  },

  /**
   * Retrieve a gractivegroup record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gractivegroup.fetch(ctx.params);
  },

  /**
   * Count gractivegroup records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gractivegroup.count(ctx.query);
  },

  /**
   * Create a/an gractivegroup record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gractivegroup.add(ctx.request.body);
  },

  /**
   * Update a/an gractivegroup record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gractivegroup.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gractivegroup record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gractivegroup.remove(ctx.params);
  },

  /**
   * Add relation to a/an gractivegroup record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gractivegroup.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gractivegroup record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gractivegroup.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gractivegroup record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gractivegroup.removeRelation(ctx.params, ctx.request.body);
  }
};
