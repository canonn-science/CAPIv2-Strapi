'use strict';

/**
 * Gbmessage.js controller
 *
 * @description: A set of functions called "actions" for managing `Gbmessage`.
 */

module.exports = {

  /**
   * Retrieve gbmessage records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    ctx.set('Content-Range', await Gbmessage.count());
    if (ctx.query._q) {
      return strapi.services.gbmessage.search(ctx.query);
    } else {
      return strapi.services.gbmessage.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a gbmessage record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gbmessage.fetch(ctx.params);
  },

  /**
   * Count gbmessage records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.gbmessage.count(ctx.query, populate);
  },

  /**
   * Create a/an gbmessage record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gbmessage.add(ctx.request.body);
  },

  /**
   * Update a/an gbmessage record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gbmessage.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gbmessage record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gbmessage.remove(ctx.params);
  }
};
