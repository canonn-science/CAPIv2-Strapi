'use strict';

/**
 * Cmdr.js controller
 *
 * @description: A set of functions called "actions" for managing `Cmdr`.
 */

module.exports = {

  /**
   * Retrieve cmdr records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.cmdr.fetchAll(ctx.query);
  },

  /**
   * Retrieve a cmdr record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.cmdr.fetch(ctx.params);
  },

  /**
   * Count cmdr records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.cmdr.count(ctx.query);
  },

  /**
   * Create a/an cmdr record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.cmdr.add(ctx.request.body);
  },

  /**
   * Update a/an cmdr record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.cmdr.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an cmdr record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.cmdr.remove(ctx.params);
  },

  /**
   * Add relation to a/an cmdr record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.cmdr.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an cmdr record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.cmdr.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an cmdr record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.cmdr.removeRelation(ctx.params, ctx.request.body);
  }
};
