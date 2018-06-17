'use strict';

/**
 * Tbreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Tbreport`.
 */

module.exports = {

  /**
   * Retrieve tbreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.tbreport.fetchAll(ctx.query);
  },

  /**
   * Retrieve a tbreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tbreport.fetch(ctx.params);
  },

  /**
   * Count tbreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.tbreport.count(ctx.query);
  },

  /**
   * Create a/an tbreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tbreport.add(ctx.request.body);
  },

  /**
   * Update a/an tbreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tbreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tbreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tbreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an tbreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.tbreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an tbreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.tbreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an tbreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.tbreport.removeRelation(ctx.params, ctx.request.body);
  }
};
