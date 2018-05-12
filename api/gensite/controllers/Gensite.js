'use strict';

/**
 * Gensite.js controller
 *
 * @description: A set of functions called "actions" for managing `Gensite`.
 */

module.exports = {

  /**
   * Retrieve gensite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.gensite.fetchAll(ctx.query);
  },

  /**
   * Retrieve a gensite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gensite.fetch(ctx.params);
  },

  /**
   * Create a/an gensite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gensite.add(ctx.request.body);
  },

  /**
   * Update a/an gensite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gensite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gensite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gensite.remove(ctx.params);
  },

  /**
   * Add relation to a/an gensite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gensite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gensite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gensite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gensite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gensite.removeRelation(ctx.params, ctx.request.body);
  }
};
