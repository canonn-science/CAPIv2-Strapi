'use strict';

/**
 * Btsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Btsite`.
 */

module.exports = {

  /**
   * Retrieve btsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Btsite.count());
    if (ctx.query._q) {
      return strapi.services.btsite.search(ctx.query);
    } else {
      return strapi.services.btsite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a btsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.btsite.fetch(ctx.params);
  },

  /**
   * Count btsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.btsite.count(ctx.query);
  },

  /**
   * Create a/an btsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.btsite.add(ctx.request.body);
  },

  /**
   * Update a/an btsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.btsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an btsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.btsite.remove(ctx.params);
  }
};
