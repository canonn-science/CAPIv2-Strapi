'use strict';

/**
 * Twsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Twsite`.
 */

module.exports = {

  /**
   * Retrieve twsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.twsite.fetchAll(ctx.query);
  },

  /**
   * Retrieve a twsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.twsite.fetch(ctx.params);
  },

  /**
   * Create a/an twsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.twsite.add(ctx.request.body);
  },

  /**
   * Update a/an twsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.twsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an twsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.twsite.remove(ctx.params);
  },

  /**
   * Add relation to a/an twsite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.twsite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an twsite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.twsite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an twsite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.twsite.removeRelation(ctx.params, ctx.request.body);
  }
};
