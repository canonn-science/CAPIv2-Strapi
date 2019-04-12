'use strict';

/**
 * Gsartifact.js controller
 *
 * @description: A set of functions called "actions" for managing `Gsartifact`.
 */

module.exports = {

  /**
   * Retrieve gsartifact records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Gsartifact.count());
    if (ctx.query._q) {
      return strapi.services.gsartifact.search(ctx.query);
    } else {
      return strapi.services.gsartifact.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a gsartifact record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.gsartifact.fetch(ctx.params);
  },

  /**
   * Count gsartifact records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.gsartifact.count(ctx.query);
  },

  /**
   * Create a/an gsartifact record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.gsartifact.add(ctx.request.body);
  },

  /**
   * Update a/an gsartifact record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.gsartifact.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an gsartifact record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.gsartifact.remove(ctx.params);
  }
};
