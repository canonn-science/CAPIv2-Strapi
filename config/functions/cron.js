'use strict';

/**
 * Cron config that gives you an opportunity
 * to run scheduled jobs.
 *
 * The cron format consists of:
 * [MINUTE] [HOUR] [DAY OF MONTH] [MONTH OF YEAR] [DAY OF WEEK] [YEAR (optional)]
 */

module.exports = {
  '*/5 * * * *': async () => {
    if (process.env.CRON_TASK == 'true'){
      await strapi.services.materialreport.deleteOldReports();
    }
  }
};
