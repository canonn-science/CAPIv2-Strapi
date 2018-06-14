'use strict';

/**
 * Gsactiveobelisk.js controller
 *
 * @description: A set of functions called "actions" for managing `Gsactiveobelisk`.
 */

module.exports = {

  /**
   * Retrieve gsactiveobelisk records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.gsactiveobelisk.fetchAll(ctx.query);
  },

  /**
   * Retrieve a gsactiveobelisk record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gsactiveobelisk.fetch(ctx.params);
  },

  /**
   * Count gsactiveobelisk records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gsactiveobelisk.count(ctx.query);
  },

  /**
   * Create a/an gsactiveobelisk record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gsactiveobelisk.add(ctx.request.body);
  },

  /**
   * Update a/an gsactiveobelisk record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gsactiveobelisk.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gsactiveobelisk record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gsactiveobelisk.remove(ctx.params);
  },

  /**
   * Add relation to a/an gsactiveobelisk record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gsactiveobelisk.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gsactiveobelisk record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gsactiveobelisk.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gsactiveobelisk record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gsactiveobelisk.removeRelation(ctx.params, ctx.request.body);
  }
};
