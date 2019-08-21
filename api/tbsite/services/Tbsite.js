'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

module.exports = {
  /**
   * Promise to add an tbsite record
   *
   * @return {Promise}
   */

  create: async (values) => {

    if (values.subtype == undefined) {
      values.subtype = 1;
    }

    if (values.cycle == undefined) {
      values.cycle = 1;
    }

    // If checks pass, proceed to create data
    return strapi.query('Tbsite').create(values);
  },
};
