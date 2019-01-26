'use strict';

/**
 * Hdsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Hdsite`.
 */

module.exports = {

  /**
   * Retrieve hdsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.hdsite.search(ctx.query);
    } else {
      return strapi.services.hdsite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a hdsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.hdsite.fetch(ctx.params);
  },

  /**
   * Count hdsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.hdsite.count(ctx.query);
  },

  /**
   * Create a/an hdsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.hdsite.add(ctx.request.body);
  },

  /**
   * Update a/an hdsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.hdsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an hdsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.hdsite.remove(ctx.params);
  }
};
