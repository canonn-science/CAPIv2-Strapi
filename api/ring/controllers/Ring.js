'use strict';

/**
 * Ring.js controller
 *
 * @description: A set of functions called "actions" for managing `Ring`.
 */

module.exports = {

  /**
   * Retrieve ring records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.ring.fetchAll(ctx.query);
  },

  /**
   * Retrieve a ring record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.ring.fetch(ctx.params);
  },

  /**
   * Create a/an ring record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.ring.add(ctx.request.body);
  },

  /**
   * Update a/an ring record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.ring.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an ring record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.ring.remove(ctx.params);
  },

  /**
   * Add relation to a/an ring record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.ring.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an ring record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.ring.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an ring record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.ring.removeRelation(ctx.params, ctx.request.body);
  }
};
