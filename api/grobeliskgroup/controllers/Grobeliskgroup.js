'use strict';

/**
 * Grobeliskgroup.js controller
 *
 * @description: A set of functions called "actions" for managing `Grobeliskgroup`.
 */

module.exports = {

  /**
   * Retrieve grobeliskgroup records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Grobeliskgroup.count());
    if (ctx.query._q) {
      return strapi.services.grobeliskgroup.search(ctx.query);
    } else {
      return strapi.services.grobeliskgroup.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a grobeliskgroup record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grobeliskgroup.fetch(ctx.params);
  },

  /**
   * Count grobeliskgroup records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.grobeliskgroup.count(ctx.query, populate);
  },

  /**
   * Create a/an grobeliskgroup record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grobeliskgroup.add(ctx.request.body);
  },

  /**
   * Update a/an grobeliskgroup record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grobeliskgroup.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grobeliskgroup record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grobeliskgroup.remove(ctx.params);
  }
};
