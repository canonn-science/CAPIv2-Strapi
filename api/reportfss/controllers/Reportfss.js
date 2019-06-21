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
      ctx.set('Content-Range', await strapi.services.reportfss.countSearch(ctx.query));
      return strapi.services.reportfss.search(ctx.query);
    }

    ctx.set('Content-Range', await strapi.services.reportfss.count(ctx.query));
    return strapi.services.reportfss.find(ctx.query);
  }
};
