'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

module.exports = {

  /**
   * Promise to deny blocked clients on reports.
   *
   * @return {Promise}
   */

  blockClient: async (clientVersion) => {

    if (process.env.BLACKLIST_CLIENT == 'true') {
      if (clientVersion == undefined) {

        const err = new Error('You are missing a client version, please speak to your client author to ensure a client version is passed.');
        err.status = 400;
        err.expose = false;
        throw err;

      }

      // Need to ask alexandre about the internal API changes as fetchAll no longer exists
      let clientVersionResult = await strapi.api.excludeclient.services.excludeclient.find({
        version: clientVersion
      });
      let clientVersionData = null;

      if (clientVersionResult.models.length > 0) {

        clientVersionData = Object.setPrototypeOf(clientVersionResult.models[0].attributes, {});

      } else {

        clientVersionData = null;

      }

      if (clientVersionData != null && clientVersionResult.models != undefined && clientVersionData.version == clientVersion) {

        const err = new Error(`Your Client: ${clientVersionData.version} is in our blacklist. You should update your client or talk to the author.`);
        err.status = 418;
        err.expose = false;
        throw err;

      }
    }
  },
};
