'use strict';

/**
 * Grcodexdata.js controller
 *
 * @description: A set of functions called "actions" for managing `Grcodexdata`.
 */

module.exports = {

  /**
   * Retrieve grcodexdata records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.grcodexdata.search(ctx.query);
    } else {
      return strapi.services.grcodexdata.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a grcodexdata record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grcodexdata.fetch(ctx.params);
  },

  /**
   * Count grcodexdata records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.grcodexdata.count(ctx.query);
  },

  /**
   * Create a/an grcodexdata record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grcodexdata.add(ctx.request.body);
  },

  /**
   * Update a/an grcodexdata record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grcodexdata.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grcodexdata record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grcodexdata.remove(ctx.params);
  },

  /**
   * Add relation to a/an grcodexdata record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.grcodexdata.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an grcodexdata record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.grcodexdata.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an grcodexdata record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.grcodexdata.removeRelation(ctx.params, ctx.request.body);
  }
};
