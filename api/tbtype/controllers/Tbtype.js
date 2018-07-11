'use strict';

/**
 * Tbtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Tbtype`.
 */

module.exports = {

  /**
   * Retrieve tbtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.tbtype.search(ctx.query);
    } else {
      return strapi.services.tbtype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a tbtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tbtype.fetch(ctx.params);
  },

  /**
   * Count tbtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.tbtype.count(ctx.query);
  },

  /**
   * Create a/an tbtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tbtype.add(ctx.request.body);
  },

  /**
   * Update a/an tbtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tbtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tbtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tbtype.remove(ctx.params);
  },

  /**
   * Add relation to a/an tbtype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.tbtype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an tbtype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.tbtype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an tbtype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.tbtype.removeRelation(ctx.params, ctx.request.body);
  }
};
