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
      entitiesCount = await strapi.services.genlog.countSearch(ctx.query);
      entities = await strapi.services.genlog.search(ctx.query);
    } else {
      entitiesCount = await strapi.services.genlog.count(ctx.query);
      entities = await strapi.services.genlog.find(ctx.query);
    }

    ctx.set('Content-Range', entitiesCount);

    return entities.map(entity =>
      sanitizeEntity(entity, { model: strapi.models.genlog })
    );
  },
};
