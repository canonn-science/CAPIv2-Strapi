'use strict';

/**
 * Gscodexdata.js controller
 *
 * @description: A set of functions called "actions" for managing `Gscodexdata`.
 */

module.exports = {

  /**
   * Retrieve gscodexdata records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gscodexdata.search(ctx.query);
    } else {
      return strapi.services.gscodexdata.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gscodexdata record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gscodexdata.fetch(ctx.params);
  },

  /**
   * Count gscodexdata records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gscodexdata.count(ctx.query);
  },

  /**
   * Create a/an gscodexdata record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gscodexdata.add(ctx.request.body);
  },

  /**
   * Update a/an gscodexdata record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gscodexdata.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gscodexdata record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gscodexdata.remove(ctx.params);
  },

  /**
   * Add relation to a/an gscodexdata record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gscodexdata.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gscodexdata record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gscodexdata.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gscodexdata record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gscodexdata.removeRelation(ctx.params, ctx.request.body);
  }
};
