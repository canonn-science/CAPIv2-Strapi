'use strict';

/**
 * Mstype.js controller
 *
 * @description: A set of functions called "actions" for managing `Mstype`.
 */

module.exports = {

  /**
   * Retrieve mstype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.mstype.search(ctx.query);
    } else {
      return strapi.services.mstype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a mstype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.mstype.fetch(ctx.params);
  },

  /**
   * Count mstype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.mstype.count(ctx.query);
  },

  /**
   * Create a/an mstype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.mstype.add(ctx.request.body);
  },

  /**
   * Update a/an mstype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.mstype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an mstype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.mstype.remove(ctx.params);
  },

  /**
   * Add relation to a/an mstype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.mstype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an mstype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.mstype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an mstype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.mstype.removeRelation(ctx.params, ctx.request.body);
  }
};
