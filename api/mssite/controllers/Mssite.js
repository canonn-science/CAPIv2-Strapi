'use strict';

/**
 * Mssite.js controller
 *
 * @description: A set of functions called "actions" for managing `Mssite`.
 */

module.exports = {

  /**
   * Retrieve mssite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.mssite.fetchAll(ctx.query);
  },

  /**
   * Retrieve a mssite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.mssite.fetch(ctx.params);
  },

  /**
   * Count mssite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.mssite.count(ctx.query);
  },

  /**
   * Create a/an mssite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.mssite.add(ctx.request.body);
  },

  /**
   * Update a/an mssite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.mssite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an mssite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.mssite.remove(ctx.params);
  },

  /**
   * Add relation to a/an mssite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.mssite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an mssite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.mssite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an mssite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.mssite.removeRelation(ctx.params, ctx.request.body);
  }
};
