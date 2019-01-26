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
    if (ctx.query._q) {
      return strapi.services.gsactiveobelisk.search(ctx.query);
    } else {
      return strapi.services.gsactiveobelisk.fetchAll(ctx.query);
    }
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
  }
};
