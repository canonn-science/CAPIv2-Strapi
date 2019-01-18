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
    if (ctx.query._q) {
      return strapi.services.gensite.search(ctx.query);
    } else {
      return strapi.services.gensite.fetchAll(ctx.query);
    }
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
   * Count gensite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gensite.count(ctx.query);
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
  }
};
