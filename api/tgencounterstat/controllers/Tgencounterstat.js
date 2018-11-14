'use strict';

/**
 * Tgencounterstat.js controller
 *
 * @description: A set of functions called "actions" for managing `Tgencounterstat`.
 */

module.exports = {

  /**
   * Retrieve tgencounterstat records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.tgencounterstat.search(ctx.query);
    } else {
      return strapi.services.tgencounterstat.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a tgencounterstat record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.tgencounterstat.fetch(ctx.params);
  },

  /**
   * Count tgencounterstat records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.tgencounterstat.count(ctx.query);
  },

  /**
   * Create a/an tgencounterstat record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.tgencounterstat.add(ctx.request.body);
  },

  /**
   * Update a/an tgencounterstat record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.tgencounterstat.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an tgencounterstat record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.tgencounterstat.remove(ctx.params);
  },

  /**
   * Add relation to a/an tgencounterstat record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.tgencounterstat.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an tgencounterstat record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.tgencounterstat.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an tgencounterstat record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.tgencounterstat.removeRelation(ctx.params, ctx.request.body);
  }
};
