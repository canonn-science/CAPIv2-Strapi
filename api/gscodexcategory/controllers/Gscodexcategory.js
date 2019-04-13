'use strict';

/**
 * Gscodexcategory.js controller
 *
 * @description: A set of functions called "actions" for managing `Gscodexcategory`.
 */

module.exports = {

  /**
   * Retrieve gscodexcategory records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Gscodexcategory.count());
    if (ctx.query._q) {
      return strapi.services.gscodexcategory.search(ctx.query);
    } else {
      return strapi.services.gscodexcategory.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gscodexcategory record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gscodexcategory.fetch(ctx.params);
  },

  /**
   * Count gscodexcategory records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gscodexcategory.count(ctx.query);
  },

  /**
   * Create a/an gscodexcategory record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gscodexcategory.add(ctx.request.body);
  },

  /**
   * Update a/an gscodexcategory record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gscodexcategory.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gscodexcategory record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gscodexcategory.remove(ctx.params);
  }
};
