'use strict';

/**
 * Tbdefense.js controller
 *
 * @description: A set of functions called "actions" for managing `Tbdefense`.
 */

module.exports = {

  /**
   * Retrieve tbdefense records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.tbdefense.search(ctx.query);
    } else {
      return strapi.services.tbdefense.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a tbdefense record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tbdefense.fetch(ctx.params);
  },

  /**
   * Count tbdefense records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.tbdefense.count(ctx.query);
  },

  /**
   * Create a/an tbdefense record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tbdefense.add(ctx.request.body);
  },

  /**
   * Update a/an tbdefense record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tbdefense.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tbdefense record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tbdefense.remove(ctx.params);
  },

  /**
   * Add relation to a/an tbdefense record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.tbdefense.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an tbdefense record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.tbdefense.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an tbdefense record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.tbdefense.removeRelation(ctx.params, ctx.request.body);
  }
};
