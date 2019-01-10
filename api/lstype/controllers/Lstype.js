'use strict';

/**
 * Lstype.js controller
 *
 * @description: A set of functions called "actions" for managing `Lstype`.
 */

module.exports = {

  /**
   * Retrieve lstype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.lstype.search(ctx.query);
    } else {
      return strapi.services.lstype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a lstype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.lstype.fetch(ctx.params);
  },

  /**
   * Count lstype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.lstype.count(ctx.query);
  },

  /**
   * Create a/an lstype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.lstype.add(ctx.request.body);
  },

  /**
   * Update a/an lstype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.lstype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an lstype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.lstype.remove(ctx.params);
  },

  /**
   * Add relation to a/an lstype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.lstype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an lstype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.lstype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an lstype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.lstype.removeRelation(ctx.params, ctx.request.body);
  }
};
