'use strict';

/**
 * Gvtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Gvtype`.
 */

module.exports = {

  /**
   * Retrieve gvtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gvtype.search(ctx.query);
    } else {
      return strapi.services.gvtype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gvtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gvtype.fetch(ctx.params);
  },

  /**
   * Count gvtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gvtype.count(ctx.query);
  },

  /**
   * Create a/an gvtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gvtype.add(ctx.request.body);
  },

  /**
   * Update a/an gvtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gvtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gvtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gvtype.remove(ctx.params);
  },

  /**
   * Add relation to a/an gvtype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gvtype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gvtype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gvtype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gvtype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gvtype.removeRelation(ctx.params, ctx.request.body);
  }
};
