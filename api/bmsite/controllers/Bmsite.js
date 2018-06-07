'use strict';

/**
 * Bmsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Bmsite`.
 */

module.exports = {

  /**
   * Retrieve bmsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.bmsite.fetchAll(ctx.query);
  },

  /**
   * Retrieve a bmsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.bmsite.fetch(ctx.params);
  },

  /**
   * Count bmsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.bmsite.count(ctx.query);
  },

  /**
   * Create a/an bmsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.bmsite.add(ctx.request.body);
  },

  /**
   * Update a/an bmsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.bmsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an bmsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.bmsite.remove(ctx.params);
  },

  /**
   * Add relation to a/an bmsite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.bmsite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an bmsite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.bmsite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an bmsite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.bmsite.removeRelation(ctx.params, ctx.request.body);
  }
};
