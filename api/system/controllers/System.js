'use strict';

/**
 * System.js controller
 *
 * @description: A set of functions called "actions" for managing `System`.
 */

module.exports = {

  /**
   * Retrieve system records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.system.fetchAll(ctx.query);
  },

  /**
   * Retrieve a system record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.system.fetch(ctx.params);
  },

  /**
   * Create a/an system record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.system.add(ctx.request.body);
  },

  /**
   * Update a/an system record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.system.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an system record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.system.remove(ctx.params);
  },

  /**
   * Add relation to a/an system record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.system.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an system record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.system.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an system record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.system.removeRelation(ctx.params, ctx.request.body);
  }
};
