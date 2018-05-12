'use strict';

/**
 * Lssite.js controller
 *
 * @description: A set of functions called "actions" for managing `Lssite`.
 */

module.exports = {

  /**
   * Retrieve lssite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.lssite.fetchAll(ctx.query);
  },

  /**
   * Retrieve a lssite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.lssite.fetch(ctx.params);
  },

  /**
   * Create a/an lssite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.lssite.add(ctx.request.body);
  },

  /**
   * Update a/an lssite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.lssite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an lssite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.lssite.remove(ctx.params);
  },

  /**
   * Add relation to a/an lssite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.lssite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an lssite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.lssite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an lssite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.lssite.removeRelation(ctx.params, ctx.request.body);
  }
};
