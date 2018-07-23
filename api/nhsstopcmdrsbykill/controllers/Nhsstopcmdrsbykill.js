'use strict';

/**
 * Nhsstopcmdrsbykill.js controller
 *
 * @description: A set of functions called "actions" for managing `Nhsstopcmdrsbykill`.
 */

module.exports = {

  /**
   * Retrieve nhsstopcmdrsbykill records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.nhsstopcmdrsbykill.search(ctx.query);
    } else {
      return strapi.services.nhsstopcmdrsbykill.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a nhsstopcmdrsbykill record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.nhsstopcmdrsbykill.fetch(ctx.params);
  },

  /**
   * Count nhsstopcmdrsbykill records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.nhsstopcmdrsbykill.count(ctx.query);
  },

  /**
   * Create a/an nhsstopcmdrsbykill record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.nhsstopcmdrsbykill.add(ctx.request.body);
  },

  /**
   * Update a/an nhsstopcmdrsbykill record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.nhsstopcmdrsbykill.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an nhsstopcmdrsbykill record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.nhsstopcmdrsbykill.remove(ctx.params);
  },

  /**
   * Add relation to a/an nhsstopcmdrsbykill record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.nhsstopcmdrsbykill.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an nhsstopcmdrsbykill record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.nhsstopcmdrsbykill.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an nhsstopcmdrsbykill record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.nhsstopcmdrsbykill.removeRelation(ctx.params, ctx.request.body);
  }
};
