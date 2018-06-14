'use strict';

/**
 * Ringtype.js controller
 *
 * @description: A set of functions called "actions" for managing `Ringtype`.
 */

module.exports = {

  /**
   * Retrieve ringtype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.ringtype.fetchAll(ctx.query);
  },

  /**
   * Retrieve a ringtype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.ringtype.fetch(ctx.params);
  },

  /**
   * Count ringtype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.ringtype.count(ctx.query);
  },

  /**
   * Create a/an ringtype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.ringtype.add(ctx.request.body);
  },

  /**
   * Update a/an ringtype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.ringtype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an ringtype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.ringtype.remove(ctx.params);
  },

  /**
   * Add relation to a/an ringtype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.ringtype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an ringtype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.ringtype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an ringtype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.ringtype.removeRelation(ctx.params, ctx.request.body);
  }
};
