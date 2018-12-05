'use strict';

/**
 * Apiupdate.js controller
 *
 * @description: A set of functions called "actions" for managing `Apiupdate`.
 */

module.exports = {

  /**
   * Retrieve apiupdate records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.apiupdate.search(ctx.query);
    } else {
      return strapi.services.apiupdate.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a apiupdate record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.apiupdate.fetch(ctx.params);
  },

  /**
   * Count apiupdate records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.apiupdate.count(ctx.query);
  },

  /**
   * Create a/an apiupdate record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.apiupdate.add(ctx.request.body);
  },

  /**
   * Update a/an apiupdate record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.apiupdate.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an apiupdate record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.apiupdate.remove(ctx.params);
  },

  /**
   * Add relation to a/an apiupdate record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.apiupdate.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an apiupdate record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.apiupdate.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an apiupdate record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.apiupdate.removeRelation(ctx.params, ctx.request.body);
  }
};
