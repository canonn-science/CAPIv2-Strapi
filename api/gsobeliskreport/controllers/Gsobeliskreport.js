'use strict';

/**
 * Gsobeliskreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Gsobeliskreport`.
 */

module.exports = {

  /**
   * Retrieve gsobeliskreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.gsobeliskreport.fetchAll(ctx.query);
  },

  /**
   * Retrieve a gsobeliskreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gsobeliskreport.fetch(ctx.params);
  },

  /**
   * Count gsobeliskreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gsobeliskreport.count(ctx.query);
  },

  /**
   * Create a/an gsobeliskreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gsobeliskreport.add(ctx.request.body);
  },

  /**
   * Update a/an gsobeliskreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gsobeliskreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gsobeliskreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gsobeliskreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an gsobeliskreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gsobeliskreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gsobeliskreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gsobeliskreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gsobeliskreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gsobeliskreport.removeRelation(ctx.params, ctx.request.body);
  }
};
