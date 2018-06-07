'use strict';

/**
 * Tbsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Tbsite`.
 */

module.exports = {

  /**
   * Retrieve tbsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.tbsite.fetchAll(ctx.query);
  },

  /**
   * Retrieve a tbsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tbsite.fetch(ctx.params);
  },

  /**
   * Count tbsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.tbsite.count(ctx.query);
  },

  /**
   * Create a/an tbsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tbsite.add(ctx.request.body);
  },

  /**
   * Update a/an tbsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tbsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tbsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tbsite.remove(ctx.params);
  },

  /**
   * Add relation to a/an tbsite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.tbsite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an tbsite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.tbsite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an tbsite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.tbsite.removeRelation(ctx.params, ctx.request.body);
  }
};
