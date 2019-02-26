'use strict';

/**
 * Alert.js controller
 *
 * @description: A set of functions called "actions" for managing `Alert`.
 */

module.exports = {

  /**
   * Retrieve alert records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.alert.search(ctx.query);
    } else {
      return strapi.services.alert.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a alert record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.alert.fetch(ctx.params);
  },

  /**
   * Count alert records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.alert.count(ctx.query);
  },

  /**
   * Create a/an alert record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.alert.add(ctx.request.body);
  },

  /**
   * Update a/an alert record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.alert.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an alert record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.alert.remove(ctx.params);
  }
};
