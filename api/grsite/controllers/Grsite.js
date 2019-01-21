'use strict';

/**
 * Grsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Grsite`.
 */

module.exports = {

  /**
   * Retrieve grsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.grsite.search(ctx.query);
    } else {
      return strapi.services.grsite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a grsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grsite.fetch(ctx.params);
  },

  /**
   * Count grsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.grsite.count(ctx.query);
  },

  /**
   * Create a/an grsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grsite.add(ctx.request.body);
  },

  /**
   * Update a/an grsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grsite.remove(ctx.params);
  }
};
