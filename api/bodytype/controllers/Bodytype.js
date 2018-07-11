'use strict';

/**
 * Bodytype.js controller
 *
 * @description: A set of functions called "actions" for managing `Bodytype`.
 */

module.exports = {

  /**
   * Retrieve bodytype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.bodytype.search(ctx.query);
    } else {
      return strapi.services.bodytype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a bodytype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.bodytype.fetch(ctx.params);
  },

  /**
   * Count bodytype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.bodytype.count(ctx.query);
  },

  /**
   * Create a/an bodytype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.bodytype.add(ctx.request.body);
  },

  /**
   * Update a/an bodytype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.bodytype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an bodytype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.bodytype.remove(ctx.params);
  },

  /**
   * Add relation to a/an bodytype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.bodytype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an bodytype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.bodytype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an bodytype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.bodytype.removeRelation(ctx.params, ctx.request.body);
  }
};
