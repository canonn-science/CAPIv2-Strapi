'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

const boom = require('boom');

module.exports = {
  /**
   * Promise to deny blocked CMDRs on reports.
   *
   * @return {Promise}
   */

  blockCMDR: async (cmdrName) => {

    if (process.env.BLACKLIST_CMDR == 'true') {
      if (cmdrName == undefined) {
        throw boom.teapot('You are missing a CMDR Name, anonymous reporting is supported.');
      }

      let cmdrQuery = await strapi.api.excludecmdr.services.excludecmdr.find({
        cmdrName: cmdrName
      });
      let cmdrData = null;
      let cmdrResult = cmdrQuery.toJSON();

      if (cmdrResult[0] != undefined) {
        cmdrData = cmdrResult[0];
      } else {
        cmdrData = null;
      }

      if (cmdrData != null && cmdrData != undefined && cmdrData.cmdrName == cmdrName) {
        throw boom.teapot(`Your CMDR: ${cmdrData.cmdrName} is in our blacklist. This is due to your CMDR being flagged for abuse.`);
      }
    }
  },
};
