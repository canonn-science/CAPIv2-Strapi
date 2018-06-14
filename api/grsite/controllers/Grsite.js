'use strict';

/**
 * Grsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Grsite`.
 */

module.exports = {

  /**
   * Retrieve grsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.grsite.fetchAll(ctx.query);
  },

  /**
   * Retrieve a grsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grsite.fetch(ctx.params);
  },

  /**
   * Count grsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.grsite.count(ctx.query);
  },

  /**
   * Create a/an grsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grsite.add(ctx.request.body);
  },

  /**
   * Update a/an grsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grsite.remove(ctx.params);
  },

  /**
   * Add relation to a/an grsite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.grsite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an grsite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.grsite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an grsite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.grsite.removeRelation(ctx.params, ctx.request.body);
  }
};
