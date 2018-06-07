'use strict';

/**
 * Atmosphere.js controller
 *
 * @description: A set of functions called "actions" for managing `Atmosphere`.
 */

module.exports = {

  /**
   * Retrieve atmosphere records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.atmosphere.fetchAll(ctx.query);
  },

  /**
   * Retrieve a atmosphere record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.atmosphere.fetch(ctx.params);
  },

  /**
   * Count atmosphere records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.atmosphere.count(ctx.query);
  },

  /**
   * Create a/an atmosphere record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.atmosphere.add(ctx.request.body);
  },

  /**
   * Update a/an atmosphere record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.atmosphere.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an atmosphere record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.atmosphere.remove(ctx.params);
  },

  /**
   * Add relation to a/an atmosphere record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.atmosphere.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an atmosphere record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.atmosphere.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an atmosphere record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.atmosphere.removeRelation(ctx.params, ctx.request.body);
  }
};
