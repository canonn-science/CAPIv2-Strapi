'use strict';

/**
 * Reportevent.js controller
 *
 * @description: A set of functions called "actions" for managing `Reportevent`.
 */

module.exports = {

  /**
   * Retrieve reportevent records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Reportevent.count());
    if (ctx.query._q) {
      return strapi.services.reportevent.search(ctx.query);
    } else {
      return strapi.services.reportevent.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a reportevent record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.reportevent.fetch(ctx.params);
  },

  /**
   * Count reportevent records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.reportevent.count(ctx.query);
  },

  /**
   * Create a/an reportevent record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.reportevent.add(ctx.request.body);
  },

  /**
   * Update a/an reportevent record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.reportevent.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an reportevent record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.reportevent.remove(ctx.params);
  }
};
