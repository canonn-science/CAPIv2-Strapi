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

  find: async ctx => {
    let entities;
    let entitiesCount;

    if (ctx.query._q) {
      entitiesCount = await strapi.services.tbreport.countSearch(ctx.query);
      entities = await strapi.services.tbreport.search(ctx.query);
    } else {
      entitiesCount = await strapi.services.tbreport.count(ctx.query);
      entities = await strapi.services.tbreport.find(ctx.query);
    }

    ctx.set('Content-Range', entitiesCount);

    return entities.map(entity =>
      sanitizeEntity(entity, { model: strapi.models.tbreport })
    );
  },

  /**
   * Create a record.
   *
   * @return {Object}
   */

  create: async ctx => {
    let entity;
    let data = ctx.request.body;

    if (!data.subtype) {
      data.subtype = 'Unknown';
    }

    entity = await strapi.services.tbreport.create(data);
    return sanitizeEntity(entity, { model: strapi.models.tbreport });
  }
};
