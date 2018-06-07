'use strict';

/**
 * Usssite.js controller
 *
 * @description: A set of functions called "actions" for managing `Usssite`.
 */

module.exports = {

  /**
   * Retrieve usssite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.usssite.fetchAll(ctx.query);
  },

  /**
   * Retrieve a usssite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.usssite.fetch(ctx.params);
  },

  /**
   * Count usssite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.usssite.count(ctx.query);
  },

  /**
   * Create a/an usssite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.usssite.add(ctx.request.body);
  },

  /**
   * Update a/an usssite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.usssite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an usssite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.usssite.remove(ctx.params);
  },

  /**
   * Add relation to a/an usssite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.usssite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an usssite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.usssite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an usssite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.usssite.removeRelation(ctx.params, ctx.request.body);
  }
};
