'use strict';

/**
 * Fgreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Fgreport`.
 */

module.exports = {

  /**
   * Retrieve fgreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.fgreport.fetchAll(ctx.query);
  },

  /**
   * Retrieve a fgreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fgreport.fetch(ctx.params);
  },

  /**
   * Count fgreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.fgreport.count(ctx.query);
  },

  /**
   * Create a/an fgreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fgreport.add(ctx.request.body);
  },

  /**
   * Update a/an fgreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fgreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fgreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fgreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an fgreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.fgreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an fgreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.fgreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an fgreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.fgreport.removeRelation(ctx.params, ctx.request.body);
  }
};
