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
      entitiesCount = await strapi.services.lsreport.countSearch(ctx.query);
      entities = await strapi.services.lsreport.search(ctx.query);
    } else {
      entitiesCount = await strapi.services.lsreport.count(ctx.query);
      entities = await strapi.services.lsreport.find(ctx.query);
    }

    ctx.set('Content-Range', entitiesCount);

    return entities.map(entity =>
      sanitizeEntity(entity, { model: strapi.models.lsreport })
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

    // Check Version
    await strapi.api.excludeclient.services.excludeclient.blockClient(
      data.clientVersion
    );

    // Check CMDR Name
    await strapi.api.excludecmdr.services.excludecmdr.blockCMDR(data.cmdrName);

    // Check for missing required data
    await strapi.api.global.services.global.checkReport(data, 'lsreport');

    entity = await strapi.services.lsreport.create(ctx.request.body);
    return sanitizeEntity(entity, { model: strapi.models.lsreport });
  }
};
