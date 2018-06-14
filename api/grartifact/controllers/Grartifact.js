'use strict';

/**
 * Grartifact.js controller
 *
 * @description: A set of functions called "actions" for managing `Grartifact`.
 */

module.exports = {

  /**
   * Retrieve grartifact records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.grartifact.fetchAll(ctx.query);
  },

  /**
   * Retrieve a grartifact record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grartifact.fetch(ctx.params);
  },

  /**
   * Count grartifact records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.grartifact.count(ctx.query);
  },

  /**
   * Create a/an grartifact record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grartifact.add(ctx.request.body);
  },

  /**
   * Update a/an grartifact record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grartifact.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grartifact record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grartifact.remove(ctx.params);
  },

  /**
   * Add relation to a/an grartifact record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.grartifact.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an grartifact record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.grartifact.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an grartifact record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.grartifact.removeRelation(ctx.params, ctx.request.body);
  }
};
