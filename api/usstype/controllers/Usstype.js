'use strict';

/**
 * Usstype.js controller
 *
 * @description: A set of functions called "actions" for managing `Usstype`.
 */

module.exports = {

  /**
   * Retrieve usstype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.usstype.fetchAll(ctx.query);
  },

  /**
   * Retrieve a usstype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.usstype.fetch(ctx.params);
  },

  /**
   * Count usstype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.usstype.count(ctx.query);
  },

  /**
   * Create a/an usstype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.usstype.add(ctx.request.body);
  },

  /**
   * Update a/an usstype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.usstype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an usstype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.usstype.remove(ctx.params);
  },

  /**
   * Add relation to a/an usstype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.usstype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an usstype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.usstype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an usstype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.usstype.removeRelation(ctx.params, ctx.request.body);
  }
};
