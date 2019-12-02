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

  create: async (data, { files } = {}) => {
    // Check Version
    await strapi.api.excludeclient.services.excludeclient.blockClient(
      data.clientVersion
    );

    // Check CMDR Name
    await strapi.api.excludecmdr.services.excludecmdr.blockCMDR(data.cmdrName);

    // Check for missing required data
    await strapi.api.global.services.global.checkReport(data, 'apreport');

    // If checks pass, proceed to create data
    const entry = await strapi.query('Apreport').create(data);

    // Create files if needed
    if (files) {
      await this.uploadFiles(entry, files, { model: strapi.models.apreport });
      return this.findOne({ id: entry.id });
    }

    return entry;
  }
};
