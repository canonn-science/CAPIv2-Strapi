'use strict';

/**
 * Twsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Twsite`.
 */

module.exports = {

  /**
   * Retrieve twsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.twsite.search(ctx.query);
    } else {
      return strapi.services.twsite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a twsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.twsite.fetch(ctx.params);
  },

  /**
   * Count twsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.twsite.count(ctx.query);
  },

  /**
   * Create a/an twsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.twsite.add(ctx.request.body);
  },

  /**
   * Update a/an twsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.twsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an twsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.twsite.remove(ctx.params);
  }
};
