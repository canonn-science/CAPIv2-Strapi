'use strict';

/**
 * Gssite.js controller
 *
 * @description: A set of functions called "actions" for managing `Gssite`.
 */

module.exports = {

  /**
   * Retrieve gssite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.gssite.fetchAll(ctx.query);
  },

  /**
   * Retrieve a gssite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gssite.fetch(ctx.params);
  },

  /**
   * Count gssite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gssite.count(ctx.query);
  },

  /**
   * Create a/an gssite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gssite.add(ctx.request.body);
  },

  /**
   * Update a/an gssite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gssite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gssite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gssite.remove(ctx.params);
  },

  /**
   * Add relation to a/an gssite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gssite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gssite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gssite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gssite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gssite.removeRelation(ctx.params, ctx.request.body);
  }
};
