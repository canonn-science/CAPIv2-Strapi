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
    return strapi.services.btsite.fetchAll(ctx.query);
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
  },

  /**
   * Add relation to a/an btsite record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.btsite.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an btsite record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.btsite.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an btsite record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.btsite.removeRelation(ctx.params, ctx.request.body);
  }
};
