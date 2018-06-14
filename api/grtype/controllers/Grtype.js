'use strict';

/**
 * Grtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Grtype`.
 */

module.exports = {

  /**
   * Retrieve grtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.grtype.fetchAll(ctx.query);
  },

  /**
   * Retrieve a grtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grtype.fetch(ctx.params);
  },

  /**
   * Count grtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.grtype.count(ctx.query);
  },

  /**
   * Create a/an grtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grtype.add(ctx.request.body);
  },

  /**
   * Update a/an grtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grtype.remove(ctx.params);
  },

  /**
   * Add relation to a/an grtype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.grtype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an grtype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.grtype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an grtype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.grtype.removeRelation(ctx.params, ctx.request.body);
  }
};
