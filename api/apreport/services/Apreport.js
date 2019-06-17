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

  create(values) {

    strapi.api.excludeclient.services.excludeclient.blockClient(values.clientVersion);

    return strapi.query('Apreport').create(values);
  },
};
