'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/controllers.html#core-controllers)
 * to customize this controller
 */

module.exports = {
  /**
   * Retrieve records with count in `Content-Range` header.
   *
   * @return {Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      ctx.set('Content-Range', await strapi.services.materialreport.countSearch(ctx.query));
      return strapi.services.materialreport.search(ctx.query);
    }

    ctx.set('Content-Range', await strapi.services.materialreport.count(ctx.query));
    return strapi.services.materialreport.find(ctx.query);
  }
};
