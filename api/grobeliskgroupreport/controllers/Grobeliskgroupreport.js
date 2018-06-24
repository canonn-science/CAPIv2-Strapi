'use strict';

/**
 * Grobeliskgroupreport.js controller
 *
 * @description: A set of functions called "actions" for managing `Grobeliskgroupreport`.
 */

module.exports = {

  /**
   * Retrieve grobeliskgroupreport records.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    return strapi.services.grobeliskgroupreport.fetchAll(ctx.query);
  },

  /**
   * Retrieve a grobeliskgroupreport record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.grobeliskgroupreport.fetch(ctx.params);
  },

  /**
   * Count grobeliskgroupreport records.
   *
   * @return {Number}
   */

  count: async (ctx) => {
    return strapi.services.grobeliskgroupreport.count(ctx.query);
  },

  /**
   * Create a/an grobeliskgroupreport record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.grobeliskgroupreport.add(ctx.request.body);
  },

  /**
   * Update a/an grobeliskgroupreport record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.grobeliskgroupreport.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an grobeliskgroupreport record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.grobeliskgroupreport.remove(ctx.params);
  },

  /**
   * Add relation to a/an grobeliskgroupreport record.
   *
   * @return {Object}
   */

  createRelation: async (ctx, next) => {
    return strapi.services.grobeliskgroupreport.addRelation(ctx.params, ctx.request.body);
  },

  /**
   * Update relation to a/an grobeliskgroupreport record.
   *
   * @return {Object}
   */

  updateRelation: async (ctx, next) => {
    return strapi.services.grobeliskgroupreport.editRelation(ctx.params, ctx.request.body);
  },

  /**
   * Destroy relation to a/an grobeliskgroupreport record.
   *
   * @return {Object}
   */

  destroyRelation: async (ctx, next) => {
    return strapi.services.grobeliskgroupreport.removeRelation(ctx.params, ctx.request.body);
  }
};
