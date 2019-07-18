'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

module.exports = {
  /**
   * Promise to add an materialreport record
   *
   * @return {Promise}
   */

  create: async (values) => {

    // Check Version
    await strapi.api.excludeclient.services.excludeclient.blockClient(values.clientVersion);

    // If checks pass, proceed to create data
    return strapi.query('Materialreport').create(values);
  },};
