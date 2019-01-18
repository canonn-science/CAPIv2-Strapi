'use strict';

/**
 * Gvsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Gvsite`.
 */

module.exports = {

  /**
   * Retrieve gvsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gvsite.search(ctx.query);
    } else {
      return strapi.services.gvsite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gvsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gvsite.fetch(ctx.params);
  },

  /**
   * Count gvsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gvsite.count(ctx.query);
  },

  /**
   * Create a/an gvsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gvsite.add(ctx.request.body);
  },

  /**
   * Update a/an gvsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gvsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gvsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gvsite.remove(ctx.params);
  },

  /**
   * Add relation to a/an gvsite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gvsite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gvsite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gvsite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gvsite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gvsite.removeRelation(ctx.params, ctx.request.body);
  }
};
