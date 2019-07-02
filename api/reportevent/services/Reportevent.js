'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

module.exports = {
  /**
   * Promise to add an reportEvent record
   *
   * @return {Promise}
   */

  create: async (values) => {

    // Check Version
    await strapi.api.excludeclient.services.excludeclient.blockClient(values.clientVersion);

    // Check CMDR Name
    await strapi.api.excludecmdr.services.excludecmdr.blockCMDR(values.cmdrName);

    // Check Event Names
    await strapi.api.excludeevent.services.excludeevent.blockEventName(values.eventName);

    // If checks pass, proceed to create data
    return strapi.query('Reportevent').create(values);
  },
};
