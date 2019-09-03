'use strict';
const fetch = require('node-fetch');

module.exports = {
  /**
   * Promise to add record
   *
   * @return {Promise}
   */

  create: async values => {
    try {
      let edsmData = await strapi.services.system.edsmUpdate(values);
      return strapi.query('System').create(edsmData);
    } catch (error) {
      console.log(error);
    }
  },

  /**
   * Promise to edit record
   *
   * @return {Promise}
   */

  update: async (params, values) => {
    try {
      if (!values.edsmCoordLocked) {
        let oldData = await strapi.services.system.findOne({ id: params.id });
        oldData = oldData.toJSON();

        if (oldData.edsmCoordLocked === false || typeof oldData.edsmCoordLocked === 'undefined') {
          if (typeof values.systemName === 'undefined') {
            values.systemName = oldData.systemName;
          }
          values.missingSkipCount = oldData.missingSkipCount;

          let edsmData = await strapi.services.system.edsmUpdate(values);

          return strapi.query('System').update(params, edsmData);
        }
      } else {
        return strapi.query('System').update(params, values);
      }
    } catch (error) {
      console.log(error);
    }
  },

  /**
   * Promise to fetch a system from EDSM to update a local record
   *
   * @return {Promise}
   */
  edsmUpdate: async values => {
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

    let newValues = {
      systemName: values.systemName,
      missingSkipCount: values.missingSkipCount
    };
    let edsmData = {};
    if (newValues.missingSkipCount >= 10) {
      newValues.systemName = newValues.systemName.toUpperCase();
      return newValues;
    } else {
      edsmData = await getData(values.systemName);
    }

    if (typeof edsmData !== 'undefined') {
      newValues.systemName = edsmData.name.toUpperCase();

      if (edsmData.id) {
        newValues.edsmID = edsmData.id;
      }
      if (edsmData.id64) {
        newValues.ID64 = edsmData.id64;
      }
      if (edsmData.coords) {
        newValues.edsmCoordX = edsmData.coords.x;
        newValues.edsmCoordY = edsmData.coords.y;
        newValues.edsmCoordZ = edsmData.coords.z;
      }
      if (edsmData.coordsLocked) {
        newValues.edsmCoordLocked = edsmData.coordsLocked;
      }
      if (edsmData.primaryStar) {
        newValues.primaryStar = edsmData.primaryStar;
      }
      newValues.missingSkipCount = 0;
      return newValues;
    } else {
      newValues.missingSkipCount = newValues.missingSkipCount + 1 || 1;
      newValues.systemName = newValues.systemName.toUpperCase();
      return newValues;
    }
  },
};
