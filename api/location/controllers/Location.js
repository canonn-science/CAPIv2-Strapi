'use strict';

/**
 * Location.js controller
 *
 * @description: A set of functions called "actions" for managing `Location`.
 */

module.exports = {

  /**
   * Retrieve location records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.location.fetchAll(ctx.query);
  },

  /**
   * Retrieve a location record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.location.fetch(ctx.params);
  },

  /**
   * Create a/an location record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.location.add(ctx.request.body);
  },

  /**
   * Update a/an location record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.location.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an location record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.location.remove(ctx.params);
  },

  /**
   * Add relation to a/an location record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.location.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an location record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.location.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an location record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.location.removeRelation(ctx.params, ctx.request.body);
  }
};
