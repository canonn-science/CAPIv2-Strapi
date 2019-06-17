'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

const boom = require('boom');

module.exports = {

  /**
   * Promise to deny blocked codex types on reports.
   *
   * @return {Promise}
   */

  blockCodexName: async (codexName) => {

    // Example: $Codex_Ent_L_Seed_Pln01_V1_Red_Name;
    function cleanName(name) {
      let unclean = name.toLowerCase();
      let cleaned = null;
      cleaned = unclean.replace('$', '');
      cleaned = cleaned.replace('_name', '');
      cleaned = cleaned.replace(';', '');

      return cleaned;
    }

    let codexNameCleaned = cleanName(codexName);

    if (process.env.BLACKLIST_CODEX == 'true') {
      if (codexName == undefined) {
        throw boom.teapot('You are missing a codex name, please speak to your client author to ensure a codex name is passed.');
      }

      let codexNameQuery = await strapi.api.excludecodex.services.excludecodex.find({
        codexName: codexNameCleaned
      });
      let codexNameData = null;
      let codexNameResult = codexNameQuery.toJSON();

      if (codexNameResult[0] != undefined) {
        codexNameData = codexNameResult[0];
      } else {
        codexNameData = null;
      }

      if (codexNameData != null && codexNameData != undefined && codexNameData.codexName == codexNameCleaned) {
        throw boom.teapot(`The Codex Name: ${codexName} is in our blacklist. You should update your client or talk to the author.`);
      }
    }
  },
};
