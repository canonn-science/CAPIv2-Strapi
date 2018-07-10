'use strict';

/**
 * Gractiveobelisk.js controller
 *
 * @description: A set of functions called "actions" for managing `Gractiveobelisk`.
 */

module.exports = {

  /**
   * Retrieve gractiveobelisk records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gractiveobelisk.search(ctx.query);
    } else {
      return strapi.services.gractiveobelisk.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gractiveobelisk record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gractiveobelisk.fetch(ctx.params);
  },

  /**
   * Count gractiveobelisk records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gractiveobelisk.count(ctx.query);
  },

  /**
   * Create a/an gractiveobelisk record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gractiveobelisk.add(ctx.request.body);
  },

  /**
   * Update a/an gractiveobelisk record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gractiveobelisk.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gractiveobelisk record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gractiveobelisk.remove(ctx.params);
  },

  /**
   * Add relation to a/an gractiveobelisk record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gractiveobelisk.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gractiveobelisk record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gractiveobelisk.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gractiveobelisk record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gractiveobelisk.removeRelation(ctx.params, ctx.request.body);
  }
};
