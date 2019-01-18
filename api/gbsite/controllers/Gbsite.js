'use strict';

/**
 * Gbsite.js controller
 *
 * @description: A set of functions called "actions" for managing `Gbsite`.
 */

module.exports = {

  /**
   * Retrieve gbsite records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gbsite.search(ctx.query);
    } else {
      return strapi.services.gbsite.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gbsite record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gbsite.fetch(ctx.params);
  },

  /**
   * Count gbsite records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gbsite.count(ctx.query);
  },

  /**
   * Create a/an gbsite record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gbsite.add(ctx.request.body);
  },

  /**
   * Update a/an gbsite record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gbsite.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gbsite record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gbsite.remove(ctx.params);
  }
};
