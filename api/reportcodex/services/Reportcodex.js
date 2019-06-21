'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

module.exports = {
  /**
   * Promise to add a reportCodex record
   *
   * @return {Promise}
   */

  create: async (values) => {

    // Check Codex Name
    await strapi.api.excludecodex.services.excludecodex.blockCodexName(values.codexName);

    // If checks pass, proceed to create data
    return strapi.query('Reportcodex').create(values);
  },
};
