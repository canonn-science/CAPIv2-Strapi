'use strict';

/**
 * Nhsstopcommandersbykill.js controller
 *
 * @description: A set of functions called "actions" for managing `Nhsstopcommandersbykill`.
 */

module.exports = {

  /**
   * Retrieve nhsstopcommandersbykill records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      return strapi.services.nhsstopcommandersbykill.search(ctx.query);
    } else {
      return strapi.services.nhsstopcommandersbykill.fetchAll(ctx.query);
    }
  },

  /**
   * Retrieve a nhsstopcommandersbykill record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.nhsstopcommandersbykill.fetch(ctx.params);
  },

  /**
   * Count nhsstopcommandersbykill records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.nhsstopcommandersbykill.count(ctx.query);
  },

  /**
   * Create a/an nhsstopcommandersbykill record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.nhsstopcommandersbykill.add(ctx.request.body);
  },

  /**
   * Update a/an nhsstopcommandersbykill record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.nhsstopcommandersbykill.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an nhsstopcommandersbykill record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.nhsstopcommandersbykill.remove(ctx.params);
  },

  /**
   * Add relation to a/an nhsstopcommandersbykill record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.nhsstopcommandersbykill.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an nhsstopcommandersbykill record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.nhsstopcommandersbykill.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an nhsstopcommandersbykill record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.nhsstopcommandersbykill.removeRelation(ctx.params, ctx.request.body);
  }
};
