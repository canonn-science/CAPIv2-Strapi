'use strict';
const fetch = require('node-fetch');

module.exports = {
  /**
   * Promise to add record
   *
   * @return {Promise}
   */

  create: async values => {
    // Query EDSM for systems data when a new system is added if no edsmID is present
    // This should be moved to lifecycle callbacks to prevent blocking code
    if (typeof values.edsmID === 'undefined') {
      try {
        let edsmData = await strapi.services.system.edsmUpdate(values);
        return strapi.query('System').create(edsmData);
      } catch (error) {
        console.log(error);
      }
    } else {
      return strapi.query('System').create(values);
    }
  },

  /**
   * Promise to edit record
   *
   * @return {Promise}
   */

  update: async (params, values) => {
    // If there is no edsmID in values, try to grab data from EDSM
    // This is used to allow the CAPIv2-Updater to bypass this as it already grabs data from EDSM
    if (typeof values.edsmID === 'undefined') {
      // Grabbing old data in case we need something that wasn't provided like missingSkipCount
      let oldData = await strapi.services.system.findOne({ id: params.id });
      oldData = oldData.toJSON();

      // Confirm that we actually need to ask EDSM for an update, if coords locked no reason to
      if (oldData.edsmCoordLocked === false || typeof oldData.edsmCoordLocked === 'undefined') {
        console.log('break1');
        // Grabbing old System Name if not provided
        if (typeof values.systemName === 'undefined') {
          values.systemName = oldData.systemName;
        }
        values.missingSkipCount = oldData.missingSkipCount;

        // Grabbing EDSM data and pushing it into the values to save
        try {
          let edsmData = await strapi.services.system.edsmUpdate(values);
          return strapi.query('System').update(params, edsmData);
        } catch (error) {
          console.log(error);
        }
      }
    }

    // Forcefully remove created_at
    if (values.created_at) {
      delete values.created_at;
    }

    // Forcefully remove updated_at
    if (values.updated_at) {
      delete values.updated_at;
    }

    return strapi.query('System').update(params, values);
  },

  /**
   * Promise to fetch a system from EDSM to update a local record
   *
   * @return {Promise}
   */
  edsmUpdate: async values => {
    // Setting EDSM's API URL
    const edsmAPISystem = 'https://www.edsm.net/api-v1/system?showId=1&showCoordinates=1&showPrimaryStar=1';

    // Function to fetch data from EDSM's API
    const getData = async system => {
      try {
        const response = await fetch(edsmAPISystem + '&systemName=' + encodeURIComponent(system));
        const json = await response.json();
        return json;
      } catch (error) {
        console.log(error);
      }
    };

    // Copying object values into a temporary object as to not mess with values
    let newValues = {
      systemName: values.systemName,
      missingSkipCount: values.missingSkipCount,
    };

    // Init edsmData
    let edsmData = {};

    // If missing skip count is above 10 it means we shouldn't ask EDSM again to prevent spam with bad system
    if (newValues.missingSkipCount >= 10) {
      newValues.systemName = newValues.systemName.toUpperCase();
      return newValues;
    } else {
      edsmData = await getData(values.systemName);
    }

    // Checking if EDSM has the proper data
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
      // If EDSM doesn't have the data, increase the skip count and proceed
      newValues.missingSkipCount = newValues.missingSkipCount + 1 || 1;
      newValues.systemName = newValues.systemName.toUpperCase();
      return newValues;
    }
  },
};
