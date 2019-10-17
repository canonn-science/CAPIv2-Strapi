const moment = require('moment');
const cron = require('node-cron');
require('node-json-color-stringify');
require('dotenv').config({
  path: require('find-config')('.env'),
});
const delay = ms => new Promise(res => setTimeout(res, ms));

// Module Imports
const capiLogin = require('./modules/capi/scriptModule_login');
const reportTools = require('./modules/capi/scriptModule_report');
const reportValid = require('./modules/validate/scriptModule_validateReport');
const processTools = require('./modules/validate/scriptModule_process');
const logTools = require('./modules/capi/scriptModule_log');

// Defining global JWT
let jwt = null;

// Setting URL for each server
let url = null;
if (process.env.NODE_ENV == 'production') {
  url = process.env.SCRIPT_PROD;
} else if (process.env.NODE_ENV == 'staging') {
  url = process.env.SCRIPT_STAG;
} else {
  url = process.env.SCRIPT_DEV;
}

// Set report types that will be verified and converted to sites
let reportTypes = ['ap', 'bm', 'bt', 'cs', 'fg', 'fm', 'gv', 'gy', 'ls', 'tb', 'tw'];

// Core function that calls all others for validation
const processReports = async () => {
  // updateLogError variable for apiUpdates push
  let updateLogError = false;

  // Clean update log
  let updateLog = {
    systems: {},
    bodies: {},
    cmdrs: {},
    sites: {},
  };

  console.log(
    moment()
      .utc()
      .format() + ' - Logging into CAPIv2'
  );
  jwt = await capiLogin.login(url, process.env.SCRIPT_USER, process.env.SCRIPT_PASS);

  if (!jwt) {
    console.log('LOGIN FAILED!');
    process.exit(1);
  } else {
    console.log('Successfully Logged in!');
  }

  // Start processing
  console.log('<---------------->');
  console.log(
    moment()
      .utc()
      .format() + ' - Starting to process reports'
  );
  console.log('<---------------->');

  // Get counts to check if we need to process reports for that site type
  for (let i = 0; i < reportTypes.length; i++) {
    var count;
    try {
      count = await reportTools.getCount(url, reportTypes[i], 'pending');
    } catch (error) {
      console.log(error);
    }

    // If count is more than zero, fetch reports and start processing them
    if (count > 0) {
      // Start report processing
      console.log('<---------------->');
      console.log(
        moment()
          .utc()
          .format() + ` - Running Validation on ${reportTypes[i]}reports`
      );
      console.log('<---------------->');
      updateLog[`${reportTypes[i]}reports`] = {
        count: count,
      };

      var reportsToProcess;
      try {
        reportsToProcess = await reportTools.getReports(url, reportTypes[i], 'pending');
      } catch (error) {
        console.log(error);
      }

      // Loop through reports and process one by one
      for (let r = 0; r < reportsToProcess.length; r++) {
        console.log(
          moment()
            .utc()
            .format() + ` - Processing ${reportTypes[i]}report ID: ${reportsToProcess[r].id}`
        );

        // Validate Reports
        var reportChecked;
        try {
          reportChecked = await reportValid.validateReport(url, reportTypes[i], reportsToProcess[r]);
        } catch (error) {
          console.log(error);
        }

        // Process report for Create, Update, Duplicate, or Failure
        if (
          reportChecked.valid.isValid === true &&
          reportChecked.capiv2.duplicate.updateSite === true &&
          reportChecked.capiv2.duplicate.createSite === false
        ) {
          // perform update logic

          var updatedData;
          try {
            updatedData = await processTools.update(url, jwt, reportTypes[i], reportChecked, reportsToProcess[r]);
          } catch (error) {
            console.log(error);
          }

          // Push updated IDs into updateLog
          // create structure if needed
          if (!updateLog[`${reportTypes[i]}reports`].reports) {
            updateLog[`${reportTypes[i]}reports`].reports = {};
          }

          if (!updateLog.sites[`${reportTypes[i]}sites`]) {
            updateLog.sites[`${reportTypes[i]}sites`] = {};
          }

          // Push System if updated
          if (updatedData.system) {
            (updateLog.systems.updated = updateLog.systems.updated || []).push(updatedData.system);
          }

          // Push Body if updated
          if (updatedData.body) {
            (updateLog.bodies.updated = updateLog.bodies.updated || []).push(updatedData.body);
          }

          // Push CMDR if created
          if (updatedData.cmdr) {
            (updateLog.cmdrs.created = updateLog.cmdrs.created || []).push(updatedData.cmdr);
          }

          // Push Site if updated
          if (updatedData.site) {
            (updateLog.sites[`${reportTypes[i]}sites`].updated =
              updateLog.sites[`${reportTypes[i]}sites`].updated || []).push(updatedData.site);
          }

          // Push report id
          (updateLog[`${reportTypes[i]}reports`].reports.updated =
            updateLog[`${reportTypes[i]}reports`].reports.updated || []).push(updatedData.report);

          console.log(
            moment()
              .utc()
              .format() + ' -   => Report marked for site Update'
          );
        } else if (
          reportChecked.valid.isValid === true &&
          reportChecked.capiv2.duplicate.createSite === true &&
          reportChecked.capiv2.duplicate.updateSite === false
        ) {
          // perform create logic

          var createdData;
          try {
            createdData = await processTools.create(url, jwt, reportTypes[i], reportChecked, reportsToProcess[r]);
          } catch (error) {
            console.log(error);
          }

          // Push created IDs into updateLog
          // create structure if needed
          if (!updateLog[`${reportTypes[i]}reports`].reports) {
            updateLog[`${reportTypes[i]}reports`].reports = {};
          }

          if (!updateLog.sites[`${reportTypes[i]}sites`]) {
            updateLog.sites[`${reportTypes[i]}sites`] = {};
          }

          // Push System if created
          if (createdData.system) {
            (updateLog.systems.created = updateLog.systems.created || []).push(createdData.system);
          }

          // Push Body if created
          if (createdData.body) {
            (updateLog.bodies.created = updateLog.bodies.created || []).push(createdData.body);
          }

          // Push CMDR if created
          if (createdData.cmdr) {
            (updateLog.cmdrs.created = updateLog.cmdrs.created || []).push(createdData.cmdr);
          }

          // Push Site if created
          if (createdData.site) {
            (updateLog.sites[`${reportTypes[i]}sites`].created =
              updateLog.sites[`${reportTypes[i]}sites`].created || []).push(createdData.site);
          }

          // Push report id
          (updateLog[`${reportTypes[i]}reports`].reports.created =
            updateLog[`${reportTypes[i]}reports`].reports.created || []).push(createdData.report);

          console.log(
            moment()
              .utc()
              .format() + ' -   => Report approved and site created'
          );
        } else if (
          reportChecked.valid.isValid === false &&
          reportChecked.capiv2.duplicate.isDuplicate === true &&
          reportChecked.capiv2.duplicate.createSite === false &&
          reportChecked.capiv2.duplicate.updateSite === false &&
          reportChecked.blacklists.cmdr.blacklisted === false &&
          reportChecked.blacklists.client.blacklisted === false
        ) {
          // create structure if needed
          if (!updateLog[`${reportTypes[i]}reports`].reports) {
            updateLog[`${reportTypes[i]}reports`].reports = {};
          }

          // Push report id
          (updateLog[`${reportTypes[i]}reports`].reports.duplicate =
            updateLog[`${reportTypes[i]}reports`].reports.duplicate || []).push(reportsToProcess[r].id);

          // perform duplicate logic
          console.log(
            moment()
              .utc()
              .format() + ' -   => Report failed - ' + reportChecked.valid.reason
          );

          let newReportComment = `[${reportChecked.valid.reportStatus.toUpperCase()}] - ${reportChecked.valid.reason}`;

          let reportData = {
            reportStatus: reportChecked.valid.reportStatus,
            reportComment: newReportComment,
            added: false,
            site: reportChecked.capiv2.duplicate.site.id,
          };

          try {
            await reportTools.updateReport(url, reportTypes[i], reportsToProcess[r].id, reportData, jwt);
          } catch (error) {
            console.log(error);
          }
        } else {
          // perform failure logic

          // create structure if needed
          if (!updateLog[`${reportTypes[i]}reports`].reports) {
            updateLog[`${reportTypes[i]}reports`].reports = {};
          }

          // Push report id
          (updateLog[`${reportTypes[i]}reports`].reports.failed =
            updateLog[`${reportTypes[i]}reports`].reports.failed || []).push(reportsToProcess[r].id);

          // Mark apiUpdates log that has error
          updateLogError = true;

          console.log(
            moment()
              .utc()
              .format() + ' -   => Report failed - ' + reportChecked.valid.reason
          );

          let newReportComment = `[${reportChecked.valid.reportStatus.toUpperCase()}] - ${reportChecked.valid.reason}`;

          let reportData = {
            reportStatus: reportChecked.valid.reportStatus,
            reportComment: newReportComment,
            added: false,
          };

          try {
            await reportTools.updateReport(url, reportTypes[i], reportsToProcess[r].id, reportData, jwt);
          } catch (error) {
            console.log(error);
          }
        }
        // Delay between processing each report
        await delay(process.env.SCRIPT_RV_DELAY);
      }
    } else {
      updateLog[`${reportTypes[i]}reports`] = {
        count: count,
      };
    }
  }
  // Push update log to CAPIv2
  let updateCount = false;
  let updateKeys = Object.keys(updateLog);

  for (let u = 0; u < updateKeys.length; u++) {
    if (updateKeys[u].includes('reports') === true) {
      if (updateLog[updateKeys[u]].count !== '0') {
        updateCount = true;
      }
    }
  }
  if (updateCount === false) {
    console.log(
      moment()
        .utc()
        .format() + ' - No Reports to process'
    );
  } else {
    console.log(
      moment()
        .utc()
        .format() + ' - Sending update log to CAPIv2'
    );

    if (process.env.SCRIPT_RV_LOGENABLED === 'true') {
      let updateLogData = {
        updateTime: moment()
          .utc()
          .format(),
        updateLog: updateLog,
      };

      if (updateLogError === true) {
        updateLogData.error = true;
      }

      try {
        await logTools.updateAPILog(url, updateLogData, jwt);
      } catch (error) {
        console.log(error);
      }

      console.log(
        moment()
          .utc()
          .format() + ' - Log sent'
      );
    } else {
      console.log(
        moment()
          .utc()
          .format() + ' - Logging Disabled'
      );
    }
  }
  console.log('>-------- End Script --------<');
};

processReports();

// if (process.env.SCRIPT_RV === 'true') {
//   cron.schedule(process.env.SCRIPT_RV_CRON, () => {
//     processReports();
//   });
// } else {
//   console.log('This script has been disabled');
//   process.exit(0);
// }

