'use strict';

const { sanitizeEntity } = require('strapi-utils');

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/controllers.html#core-controllers)
 * to customize this controller
 */

module.exports = {
  /**
   * Create a record.
   *
   * @return {Object}
   */

  create: async ctx => {
    let entity;
    let data = ctx.request.body;

    // Need to convert this to a policy
    if (!data.subtype) {
      data.subtype = 'Unknown';
    }

    entity = await strapi.services.tbreport.create(data);
    return sanitizeEntity(entity, { model: strapi.models.tbreport });
  }
};
