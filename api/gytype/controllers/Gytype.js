'use strict';

/**
 * Gytype.js controller
 *
 * @description: A set of functions called "actions" for managing `Gytype`.
 */

module.exports = {

  /**
   * Retrieve gytype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.gytype.fetchAll(ctx.query);
  },

  /**
   * Retrieve a gytype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gytype.fetch(ctx.params);
  },

  /**
   * Count gytype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gytype.count(ctx.query);
  },

  /**
   * Create a/an gytype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gytype.add(ctx.request.body);
  },

  /**
   * Update a/an gytype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gytype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gytype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gytype.remove(ctx.params);
  },

  /**
   * Add relation to a/an gytype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gytype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gytype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gytype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gytype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gytype.removeRelation(ctx.params, ctx.request.body);
  }
};
