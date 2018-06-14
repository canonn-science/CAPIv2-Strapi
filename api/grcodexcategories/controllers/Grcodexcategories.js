'use strict';

/**
 * Grcodexcategories.js controller
 *
 * @description: A set of functions called "actions" for managing `Grcodexcategories`.
 */

module.exports = {

  /**
   * Retrieve grcodexcategories records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.grcodexcategories.fetchAll(ctx.query);
  },

  /**
   * Retrieve a grcodexcategories record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grcodexcategories.fetch(ctx.params);
  },

  /**
   * Count grcodexcategories records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.grcodexcategories.count(ctx.query);
  },

  /**
   * Create a/an grcodexcategories record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grcodexcategories.add(ctx.request.body);
  },

  /**
   * Update a/an grcodexcategories record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grcodexcategories.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grcodexcategories record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grcodexcategories.remove(ctx.params);
  },

  /**
   * Add relation to a/an grcodexcategories record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.grcodexcategories.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an grcodexcategories record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.grcodexcategories.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an grcodexcategories record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.grcodexcategories.removeRelation(ctx.params, ctx.request.body);
  }
};
