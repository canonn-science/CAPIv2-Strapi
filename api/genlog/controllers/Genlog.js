'use strict';

/**
 * Genlog.js controller
 *
 * @description: A set of functions called "actions" for managing `Genlog`.
 */

module.exports = {

  /**
   * Retrieve genlog records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.genlog.search(ctx.query);
    } else {
      return strapi.services.genlog.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a genlog record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.genlog.fetch(ctx.params);
  },

  /**
   * Count genlog records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.genlog.count(ctx.query);
  },

  /**
   * Create a/an genlog record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.genlog.add(ctx.request.body);
  },

  /**
   * Update a/an genlog record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.genlog.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an genlog record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.genlog.remove(ctx.params);
  },

  /**
   * Add relation to a/an genlog record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.genlog.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an genlog record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.genlog.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an genlog record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.genlog.removeRelation(ctx.params, ctx.request.body);
  }
};
