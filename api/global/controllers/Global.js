'use strict';

/**
 * Info.js controller
 *
 * @description: A set of functions called "actions" for managing `Info`.
 */

module.exports = {

  /**
   * Retrieve CAPI Info.
   *
   * @return {Object}
   */

  info: (ctx) => {
    ctx.send({
      name: strapi.config.info.name,
      description: strapi.config.info.description,
      email: strapi.config.info.author.email,
      strapiVersion: strapi.config.info.strapi,
      capiVersion: strapi.config.info.version
    });
  },

  /**
   * Retrieve CAPI Version.
   *
   * @return {Object}
   */

  version: (ctx) => {
    ctx.send({
      strapiVersion: strapi.config.info.strapi,
      capiVersion: strapi.config.info.version
    });
  },

  /**
   * Get count of all Sites and Reports.
   *
   * @return {Object}
   */

  totalCount: () => {
    return strapi.services.global.totalCount();
  }
};
