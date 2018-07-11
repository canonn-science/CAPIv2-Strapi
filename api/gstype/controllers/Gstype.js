'use strict';

/**
 * Gstype.js controller
 *
 * @description: A set of functions called "actions" for managing `Gstype`.
 */

module.exports = {

  /**
   * Retrieve gstype records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gstype.search(ctx.query);
    } else {
      return strapi.services.gstype.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gstype record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gstype.fetch(ctx.params);
  },

  /**
   * Count gstype records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gstype.count(ctx.query);
  },

  /**
   * Create a/an gstype record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gstype.add(ctx.request.body);
  },

  /**
   * Update a/an gstype record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gstype.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gstype record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gstype.remove(ctx.params);
  },

  /**
   * Add relation to a/an gstype record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gstype.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gstype record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gstype.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gstype record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gstype.removeRelation(ctx.params, ctx.request.body);
  }
};
