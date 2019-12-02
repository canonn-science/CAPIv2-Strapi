'use strict';

const { sanitizeEntity } = require('strapi-utils');

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/controllers.html#core-controllers)
 * to customize this controller
 */

module.exports = {
  /**
   * Retrieve records with count in `Content-Range` header.
   *
   * @return {Object|Array}
   */

  find: async (ctx) => {
    let entities;
    let entitiesCount;

    if (ctx.query._q) {
      entitiesCount = await strapi.services.apreport.countSearch(ctx.query);
      entities = strapi.services.apreport.search(ctx.query);
    } else {
      entitiesCount = await strapi.services.apreport.count(ctx.query);
      entities = strapi.services.apreport.find(ctx.query);
    }

    ctx.set('Content-Range', entitiesCount );

    return entities.map(entity => sanitizeEntity(entity, { model: strapi.models.apreport }));

  }
};
