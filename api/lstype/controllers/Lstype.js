'use strict';

/**
 * Lstype.js controller
 *
 * @description: A set of functions called "actions" for managing `Lstype`.
 */

module.exports = {

  /**
   * Retrieve lstype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Lstype.count());
    if (ctx.query._q) {
      return strapi.services.lstype.search(ctx.query);
    } else {
      return strapi.services.lstype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a lstype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.lstype.fetch(ctx.params);
  },

  /**
   * Count lstype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.lstype.count(ctx.query);
  },

  /**
   * Create a/an lstype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.lstype.add(ctx.request.body);
  },

  /**
   * Update a/an lstype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.lstype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an lstype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.lstype.remove(ctx.params);
  }
};
