'use strict';

/**
 * Reportfss.js controller
 *
 * @description: A set of functions called "actions" for managing `Reportfss`.
 */

module.exports = {

  /**
   * Retrieve reportfss records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    ctx.set('Content-Range', await Reportfss.count());
    if (ctx.query._q) {
      return strapi.services.reportfss.search(ctx.query);
    } else {
      return strapi.services.reportfss.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a reportfss record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.reportfss.fetch(ctx.params);
  },

  /**
   * Count reportfss records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.reportfss.count(ctx.query);
  },

  /**
   * Create a/an reportfss record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.reportfss.add(ctx.request.body);
  },

  /**
   * Update a/an reportfss record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.reportfss.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an reportfss record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.reportfss.remove(ctx.params);
  }
};
