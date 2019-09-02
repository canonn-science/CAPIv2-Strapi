'use strict';
const fetch = require('node-fetch');


/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

module.exports = {
  /**
   * Promise to add record
   *
   * @return {Promise}
   */

  create: async (values) => {
    let edsmData = await strapi.services.system.edsmUpdate(values);

    return strapi.query('System').create(edsmData);
  },

  /**
   * Promise to edit record
   *
   * @return {Promise}
   */

  update: async (params, values) => {

    let oldData = await strapi.services.system.findOne({id: params.id});
    oldData = oldData.toJSON();

    if (oldData.edsmCoordLocked == false || oldData.edsmCoordLocked == undefined) {
      if (values.systemName == undefined) {
        values.systemName = oldData.systemName;
      }
      values.missingSkipCount = oldData.missingSkipCount;

      let edsmData = await strapi.services.system.edsmUpdate(values);

      return strapi.query('System').update(params, edsmData);
    }

    return strapi.query('System').update(params, values);
  },

  /**
   * Promise to fetch a system from EDSM to update a local record
   *
   * @return {Promise}
   */
  edsmUpdate: async (values) => {
    const edsmAPISystem = 'https://www.edsm.net/api-v1/system?showId=1&showCoordinates=1&showPrimaryStar=1';

    const getData = async system => {
      try {
        const response = await fetch(edsmAPISystem + '&systemName=' + encodeURIComponent(system));
        const json = await response.json();
        return json;
      } catch (error) {
        console.log(error);
      }
    };

    let newValues = values;
    let newData = {};
    if (newValues.missingSkipCount >= 10 ) {
      newValues.systemName = newValues.systemName.toUpperCase();
      return newValues;
    } else {
      newData = await getData(values.systemName);
    }

    if (newData != undefined) {

      newValues.systemName = newData.name.toUpperCase();

      if (newData.id) {
        newValues.edsmID = newData.id;
      }
      if (newData.id64) {
        newValues.ID64 = newData.id64;
      }
      if (newData.coords) {
        newValues.edsmCoordX = newData.coords.x;
        newValues.edsmCoordY = newData.coords.y;
        newValues.edsmCoordZ = newData.coords.z;
      }
      if (newData.coordsLocked) {
        newValues.edsmCoordLocked = newData.coordsLocked;
      }
      if (newData.primaryStar) {
        newValues.primaryStar = newData.primaryStar;
      }
      newValues.missingSkipCount = 0;
      return newValues;
    } else {
      newValues.missingSkipCount = (newValues.missingSkipCount + 1) || 1;
      newValues.systemName = newValues.systemName.toUpperCase();
      return newValues;
    }
  },
};
