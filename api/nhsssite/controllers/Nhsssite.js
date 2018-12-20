'use strict';

/**
 * Nhsssite.js controller
 *
 * @description: A set of functions called "actions" for managing `Nhsssite`.
 */

module.exports = {

  /**
   * Retrieve nhsssite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.nhsssite.search(ctx.query);
    } else {
      return strapi.services.nhsssite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a nhsssite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.nhsssite.fetch(ctx.params);
  },

  /**
   * Count nhsssite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.nhsssite.count(ctx.query);
  },

  /**
   * Create a/an nhsssite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.nhsssite.add(ctx.request.body);
  },

  /**
   * Update a/an nhsssite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.nhsssite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an nhsssite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.nhsssite.remove(ctx.params);
  },

  /**
   * Add relation to a/an nhsssite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.nhsssite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an nhsssite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.nhsssite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an nhsssite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.nhsssite.removeRelation(ctx.params, ctx.request.body);
  }
};
