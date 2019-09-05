'use strict';
const moment = require('moment');

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/services.html#core-services)
 * to customize this service
 */

module.exports = {
  /**
   * Promise to add an materialreport record
   *
   * @return {Promise}
   */

  create: async (values) => {

    // Check Version
    await strapi.api.excludeclient.services.excludeclient.blockClient(values.clientVersion);

    // Check for missing required values
    await strapi.api.global.services.global.checkReport(values, 'materialreport');

    // If checks pass, proceed to create data
    return strapi.query('Materialreport').create(values);
  },

  /**
   * Promise to delete materialreport records older than 1 month
   *
   * @return {Promise}
   */
  deleteOldReports: async () => {
    const now = moment();

    // Configure delay offset for clusters
    const delay = ms => new Promise(res => setTimeout(res, ms));
    let cronTimeout = process.env.CRON_OFFSET * 1000;
    await delay(cronTimeout);

    // this should be a looping function to get all reports but I'm lazy so
    // you get only 1000 per call
    async function deleteReports (limit = 1000) {
      let reports = await strapi.services.materialreport.find({
        _limit: limit,
        created_at_lte: now.subtract(1, 'months').utc().format('YYYY-MM-DD hh:mm:ss')
      });

      // Looping through response and deleting old reports
      if (reports.length > 0) {
        for (let i=0; i < reports.length; i++) {
          await strapi.services.materialreport.delete({
            id: reports[i].id
          });
        }
      }
    }

    deleteReports();

  },
};
