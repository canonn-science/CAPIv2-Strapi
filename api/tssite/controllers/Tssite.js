'use strict';

/**
 * Tssite.js controller
 *
 * @description: A set of functions called "actions" for managing `Tssite`.
 */

module.exports = {

  /**
   * Retrieve tssite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.tssite.fetchAll(ctx.query);
  },

  /**
   * Retrieve a tssite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tssite.fetch(ctx.params);
  },

  /**
   * Create a/an tssite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tssite.add(ctx.request.body);
  },

  /**
   * Update a/an tssite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tssite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tssite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tssite.remove(ctx.params);
  },

  /**
   * Add relation to a/an tssite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.tssite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an tssite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.tssite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an tssite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.tssite.removeRelation(ctx.params, ctx.request.body);
  }
};
