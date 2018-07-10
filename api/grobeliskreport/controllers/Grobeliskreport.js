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

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.grobeliskreport.search(ctx.query);
    } else {
      return strapi.services.grobeliskreport.fetchAll(ctx.query);
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

  count: async (ctx) => {
    return strapi.services.grobeliskreport.count(ctx.query);
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
  },

  /**
   * Add relation to a/an grobeliskreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.grobeliskreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an grobeliskreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.grobeliskreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an grobeliskreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.grobeliskreport.removeRelation(ctx.params, ctx.request.body);
  }
};
