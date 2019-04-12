'use strict';

/**
 * Tsstatus.js controller
 *
 * @description: A set of functions called "actions" for managing `Tsstatus`.
 */

module.exports = {

  /**
   * Retrieve tsstatus records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Tsstatus.count());
    if (ctx.query._q) {
      return strapi.services.tsstatus.search(ctx.query);
    } else {
      return strapi.services.tsstatus.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a tsstatus record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tsstatus.fetch(ctx.params);
  },

  /**
   * Count tsstatus records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.tsstatus.count(ctx.query);
  },

  /**
   * Create a/an tsstatus record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tsstatus.add(ctx.request.body);
  },

  /**
   * Update a/an tsstatus record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tsstatus.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tsstatus record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tsstatus.remove(ctx.params);
  }
};
