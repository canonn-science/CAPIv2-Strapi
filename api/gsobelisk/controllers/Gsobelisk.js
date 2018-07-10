'use strict';

/**
 * Gsobelisk.js controller
 *
 * @description: A set of functions called "actions" for managing `Gsobelisk`.
 */

module.exports = {

  /**
   * Retrieve gsobelisk records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gsobelisk.search(ctx.query);
    } else {
      return strapi.services.gsobelisk.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gsobelisk record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gsobelisk.fetch(ctx.params);
  },

  /**
   * Count gsobelisk records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gsobelisk.count(ctx.query);
  },

  /**
   * Create a/an gsobelisk record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gsobelisk.add(ctx.request.body);
  },

  /**
   * Update a/an gsobelisk record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gsobelisk.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gsobelisk record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gsobelisk.remove(ctx.params);
  },

  /**
   * Add relation to a/an gsobelisk record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gsobelisk.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gsobelisk record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gsobelisk.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gsobelisk record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gsobelisk.removeRelation(ctx.params, ctx.request.body);
  }
};
