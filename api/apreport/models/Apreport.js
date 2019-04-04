'use strict';

/**
 * Lifecycle callbacks for the `Apreport` model.
 */

module.exports = {
  // Before saving a value.
  // Fired before an `insert` or `update` query.
  beforeSave: async (model, attrs, options) => {

    // This entire block needs to be moved to beforeCreate when finished

    let clientVersionResult = await strapi.api.excludeclient.services.excludeclient.fetchAll({version: model.attributes.clientVersion})
    let clientVersionData = null

    if (clientVersionResult.models.length > 0) {
      clientVersionData = Object.setPrototypeOf(clientVersionResult.models[0].attributes, {})
    } else {
      clientVersionData = null
    }

    if ( clientVersionData == null || clientVersionResult.models == undefined) {
      console.log("Client not in blacklist")
      console.log('Report: '+ model.attributes.clientVersion)

      let cmdrResult = await strapi.api.excludecmdr.services.excludecmdr.fetchAll({cmdrName: model.attributes.cmdrName})
      let cmdrData = null

      if (cmdrResult.models.length > 0) {
        cmdrData = Object.setPrototypeOf(cmdrResult.models[0].attributes, {})
      } else {
        cmdrData = null
      }

      if ( cmdrData != null && cmdrData.cmdrName == model.attributes.cmdrName) {
        // send http code 412 - Precondition failed
        console.log("CMDR is blacklisted, ignore report")
      } else {
        console.log("CMDR is not blacklisted")
      }

    } else if (clientVersionData.version == model.attributes.clientVersion) {
      // send http code 412 - Precondition failed
      console.log("Client is in blacklist, ignore report.")
      console.log('Report: '+ model.attributes.clientVersion)
      console.log('Version: ' + clientVersionData.version)
    }
  },

  // After saving a value.
  // Fired after an `insert` or `update` query.
  // afterSave: async (model, response, options) => {},

  // Before fetching a value.
  // Fired before a `fetch` operation.
  // beforeFetch: async (model, columns, options) => {},

  // After fetching a value.
  // Fired after a `fetch` operation.
  // afterFetch: async (model, response, options) => {},

  // Before fetching all values.
  // Fired before a `fetchAll` operation.
  // beforeFetchAll: async (model, columns, options) => {},

  // After fetching all values.
  // Fired after a `fetchAll` operation.
  // afterFetchAll: async (model, response, options) => {},

  // Before creating a value.
  // Fired before an `insert` query.
  // beforeCreate: async (model, attrs, options) => {},

  // After creating a value.
  // Fired after an `insert` query.
  // afterCreate: async (model, attrs, options) => {},

  // Before updating a value.
  // Fired before an `update` query.
  // beforeUpdate: async (model, attrs, options) => {},

  // After updating a value.
  // Fired after an `update` query.
  // afterUpdate: async (model, attrs, options) => {},

  // Before destroying a value.
  // Fired before a `delete` query.
  // beforeDestroy: async (model, attrs, options) => {},

  // After destroying a value.
  // Fired after a `delete` query.
  // afterDestroy: async (model, attrs, options) => {}
};
