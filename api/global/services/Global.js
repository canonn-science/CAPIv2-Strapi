'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

const boom = require('boom');

module.exports = {

  /**
   * Promise to deny reports that are missing required data.
   *
   * @return {Promise}
   */

  checkReport: async (values, model) => {

    let reportModel = await strapi.models[model].allAttributes;

    console.log(reportModel);

    // Check userType has a value and is in the enum
    // ["console", "pc"]
    if (reportModel.userType.required == true) {
      if (values.userType == undefined) {
        throw boom.notAcceptable('You are missing a userType, this value should be either "pc" or "console".');
      } else if (reportModel.userType.enum.includes(values.userType) == false) {
        throw boom.notAcceptable(`The userType: "${values.userType}" you sent is not a valid one, your options are either "pc" or "console".`)
      }
    }

    // Check reportType has a value and is in the enum
    // ["new", "update", "error"]
    if (reportModel.reportType.required == true) {
      if (values.reportType == undefined) {
        throw boom.notAcceptable('You are missing a reportType, this value should be "new", "update", or "error".');
      } else if (reportModel.reportType.enum.includes(values.reportType) == false) {
        throw boom.notAcceptable(`The reportType: "${values.reportType}" you sent is not a valid one, your options are "new", "update", or "error"`)
      }
    }

    // Check systemName has a value

    // Check bodyName has a value if required

    // Check latitude and longitude have a value if required

    // Check reportStatus has a value and is in the enum
    // ["pending", "updated", "verified", "accepted", "declined", "issue", "duplicate"]
  },
};
