'use strict';

/**
 * Fmsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Fmsite`.
 */

module.exports = {

  /**
   * Retrieve fmsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.fmsite.fetchAll(ctx.query);
  },

  /**
   * Retrieve a fmsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fmsite.fetch(ctx.params);
  },

  /**
   * Create a/an fmsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fmsite.add(ctx.request.body);
  },

  /**
   * Update a/an fmsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fmsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fmsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fmsite.remove(ctx.params);
  },

  /**
   * Add relation to a/an fmsite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.fmsite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an fmsite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.fmsite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an fmsite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.fmsite.removeRelation(ctx.params, ctx.request.body);
  }
};
