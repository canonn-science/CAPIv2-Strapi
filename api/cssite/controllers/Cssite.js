'use strict';

/**
 * Cssite.js controller
 *
 * @description: A set of functions called "actions" for managing `Cssite`.
 */

module.exports = {

  /**
   * Retrieve cssite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.cssite.search(ctx.query);
    } else {
      return strapi.services.cssite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a cssite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.cssite.fetch(ctx.params);
  },

  /**
   * Count cssite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.cssite.count(ctx.query);
  },

  /**
   * Create a/an cssite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.cssite.add(ctx.request.body);
  },

  /**
   * Update a/an cssite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.cssite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an cssite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.cssite.remove(ctx.params);
  },

  /**
   * Add relation to a/an cssite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.cssite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an cssite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.cssite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an cssite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.cssite.removeRelation(ctx.params, ctx.request.body);
  }
};
