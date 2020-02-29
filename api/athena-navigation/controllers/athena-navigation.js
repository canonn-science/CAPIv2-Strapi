'use strict';
const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Retrieve records.
   *
   * @return {Array}
   */

  async find(ctx) {
    let entities;

    let queryOverride = {
      '_sort': 'order:asc'
    };

    entities = await strapi.services['athena-navigation'].find(queryOverride);

    return entities.map(entity =>
      sanitizeEntity(entity, { model: strapi.models['athena-navigation'] })
    );
  },
};
