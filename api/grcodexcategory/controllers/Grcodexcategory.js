'use strict';

/**
 * Grcodexcategory.js controller
 *
 * @description: A set of functions called "actions" for managing `Grcodexcategory`.
 */

module.exports = {

  /**
   * Retrieve grcodexcategory records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.grcodexcategory.search(ctx.query);
    } else {
      return strapi.services.grcodexcategory.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a grcodexcategory record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grcodexcategory.fetch(ctx.params);
  },

  /**
   * Count grcodexcategory records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.grcodexcategory.count(ctx.query);
  },

  /**
   * Create a/an grcodexcategory record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grcodexcategory.add(ctx.request.body);
  },

  /**
   * Update a/an grcodexcategory record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grcodexcategory.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grcodexcategory record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grcodexcategory.remove(ctx.params);
  }
};
