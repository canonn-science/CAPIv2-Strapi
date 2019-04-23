'use strict';

/**
 * Grobeliskreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Grobeliskreport`.
 */

module.exports = {

  /**
   * Retrieve grobeliskreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Grobeliskreport.count());
    if (ctx.query._q) {
      return strapi.services.grobeliskreport.search(ctx.query);
    } else {
      return strapi.services.grobeliskreport.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a grobeliskreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grobeliskreport.fetch(ctx.params);
  },

  /**
   * Count grobeliskreport records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.grobeliskreport.count(ctx.query, populate);
  },

  /**
   * Create a/an grobeliskreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grobeliskreport.add(ctx.request.body);
  },

  /**
   * Update a/an grobeliskreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grobeliskreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grobeliskreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grobeliskreport.remove(ctx.params);
  }
};
