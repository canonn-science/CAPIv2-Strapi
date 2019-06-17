'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

module.exports = {
  /**
   * Promise to add an apreport record
   *
   * @return {Promise}
   */

  create: async (values) => {

    // Check Version
    await strapi.api.excludeclient.services.excludeclient.blockClient(values.clientVersion);

    // Check CMDR Name
    await strapi.api.excludecmdr.services.excludecmdr.blockCMDR(values.cmdrName);

    // If checks pass, proceed to create data
    return strapi.query('Tbreport').create(values);
  },};
