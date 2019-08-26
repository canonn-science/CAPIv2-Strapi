'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

const boom = require('boom');

module.exports = {

  /**
   * Promise to deny blocked event types on reports.
   *
   * @return {Promise}
   */

  blockEventName: async (eventName) => {

    let eventNameCleaned = eventName.toLowerCase();

    if (process.env.BLACKLIST_EVENT == 'true') {
      if (eventName == undefined) {
        throw boom.teapot('You are missing a event name, please speak to your client author to ensure a event name is passed.');
      }

      let eventNameQuery = await strapi.api.excludeevent.services.excludeevent.find({
        eventName: eventNameCleaned
      });
      let eventNameData = null;
      let eventNameResult = eventNameQuery;

      if (eventNameResult[0] != undefined) {
        eventNameData = eventNameResult[0];
      } else {
        eventNameData = null;
      }

      if (eventNameData != null && eventNameData != undefined && eventNameData.eventName.toLowerCase() == eventNameCleaned) {
        throw boom.teapot(`The Event Name: ${eventName} is in our blacklist. You should update your client or talk to the author.`);
      }
    }
  },
};
