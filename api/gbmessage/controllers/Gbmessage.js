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

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.gbmessage.search(ctx.query);
    } else {
      return strapi.services.gbmessage.fetchAll(ctx.query);
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

  count: async (ctx) => {
    return strapi.services.gbmessage.count(ctx.query);
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
  },

  /**
   * Add relation to a/an gbmessage record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.gbmessage.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an gbmessage record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.gbmessage.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an gbmessage record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.gbmessage.removeRelation(ctx.params, ctx.request.body);
  }
};
