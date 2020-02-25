'use strict';
const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Retrieve records with count in `Content-Range` header.
   *
   * @return {Object|Array}
   */

  find: async ctx => {
    let entities;
    let entitiesCount;

    if (ctx.query._q) {
      entitiesCount = await strapi.services.killreport.countSearch(ctx.query);
      entities = await strapi.services.killreport.search(ctx.query);
    } else {
      entitiesCount = await strapi.services.killreport.count(ctx.query);
      entities = await strapi.services.killreport.find(ctx.query);
    }

    ctx.set('Content-Range', entitiesCount);

    return entities.map(entity =>
      sanitizeEntity(entity, { model: strapi.models.killreport })
    );
  },
};
