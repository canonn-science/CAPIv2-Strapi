'use strict';

/**
 * Body.js controller
 *
 * @description: A set of functions called "actions" for managing `Body`.
 */

module.exports = {

  /**
   * Retrieve body records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.body.fetchAll(ctx.query);
  },

  /**
   * Retrieve a body record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.body.fetch(ctx.params);
  },

  /**
   * Create a/an body record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.body.add(ctx.request.body);
  },

  /**
   * Update a/an body record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.body.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an body record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.body.remove(ctx.params);
  },

  /**
   * Add relation to a/an body record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.body.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an body record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.body.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an body record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.body.removeRelation(ctx.params, ctx.request.body);
  }
};
