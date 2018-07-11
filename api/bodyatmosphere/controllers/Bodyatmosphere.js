'use strict';

/**
 * Bodyatmosphere.js controller
 *
 * @description: A set of functions called "actions" for managing `Bodyatmosphere`.
 */

module.exports = {

  /**
   * Retrieve bodyatmosphere records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.bodyatmosphere.search(ctx.query);
    } else {
      return strapi.services.bodyatmosphere.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a bodyatmosphere record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.bodyatmosphere.fetch(ctx.params);
  },

  /**
   * Count bodyatmosphere records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.bodyatmosphere.count(ctx.query);
  },

  /**
   * Create a/an bodyatmosphere record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.bodyatmosphere.add(ctx.request.body);
  },

  /**
   * Update a/an bodyatmosphere record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.bodyatmosphere.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an bodyatmosphere record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.bodyatmosphere.remove(ctx.params);
  },

  /**
   * Add relation to a/an bodyatmosphere record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.bodyatmosphere.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an bodyatmosphere record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.bodyatmosphere.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an bodyatmosphere record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.bodyatmosphere.removeRelation(ctx.params, ctx.request.body);
  }
};
