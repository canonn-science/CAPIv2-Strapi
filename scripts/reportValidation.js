const moment = require('moment');
const cron = require('node-cron');
require('node-json-color-stringify');
require('dotenv').config({ path: require('find-config')('.env') });
const delay = ms => new Promise(res => setTimeout(res, ms));

// Module Imports
const capiLogin = require('./modules/capi/scriptModule_login');
const reportTools = require('./modules/capi/scriptModule_report');
const reportValid = require('./modules/validate/scriptModule_validateReport');
const processTools = require('./modules/validate/scriptModule_process');

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
  // Clean update log
  let updateLog = {};

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
    let count = await reportTools.getCount(url, reportTypes[i], 'pending');

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
      updateLog[`${reportTypes[i]}reports`] = { reportCount: count };

      let reportsToProcess = await reportTools.getReports(url, reportTypes[i], 'pending');

      // Loop through reports and process one by one
      for (let r = 0; r < reportsToProcess.length; r++) {
        console.log(
          moment()
            .utc()
            .format() + ` - Processing ${reportTypes[i]}report ID: ${reportsToProcess[r].id}`
        );

        // Validate Reports
        let reportChecked = await reportValid.validateReport(url, reportTypes[i], reportsToProcess[r]);

        // Push reportLog into UpdateLog
        (updateLog[`${reportTypes[i]}reports`].reports = updateLog[`${reportTypes[i]}reports`].reports || []).push(
          reportChecked
        );

        // Process report for Create, Update, Duplicate, or Failure
        if (
          reportChecked.valid.isValid === true &&
          reportChecked.capiv2.duplicate.updateSite === true &&
          reportChecked.capiv2.duplicate.createSite === false
        ) {
          // perform update logic

          let updatedData = await processTools.update(
            url,
            jwt,
            reportTypes[i],
            reportChecked,
            reportsToProcess[r]
          );

          // Push updated IDs into updateLog
          console.log(updatedData);

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

          let createdData = await processTools.create(
            url,
            jwt,
            reportTypes[i],
            reportChecked,
            reportsToProcess[r]
          );

          // Push created IDs into updateLog
          console.log(createdData);

          console.log(
            moment()
              .utc()
              .format() + ' -   => Report approved and site created'
          );
        } else if (
          reportChecked.valid.isValid === false &&
          reportChecked.capiv2.duplicate.isDuplicate === true &&
          reportChecked.capiv2.duplicate.createSite === false &&
          reportChecked.capiv2.duplicate.updateSite === false
        ) {
          // perform duplicate logic
          console.log(
            moment()
              .utc()
              .format() + ' -   => Report marked as duplicate'
          );

          let newReportComment = `[${reportChecked.valid.reportStatus.toUpperCase()}] - ${reportChecked.valid.reason}`;

          let reportData = {
            reportStatus: reportChecked.valid.reportStatus,
            reportComment: newReportComment,
            added: false,
            site: reportChecked.capiv2.duplicate.site.id,
          };

          await reportTools.updateReport(url, reportTypes[i], reportsToProcess[r].id, reportData, jwt);
        } else {
          // perform failure logic
          console.log(
            moment()
              .utc()
              .format() + ' -   => Report failed for unknown reason'
          );
          console.log(reportChecked);
          console.log(reportChecked.capiv2.duplicate.site);
          delay(2000);

          let newReportComment = `[${reportChecked.valid.reportStatus.toUpperCase()}] - ${reportChecked.valid.reason}`;

          let reportData = {
            reportStatus: reportChecked.valid.reportStatus,
            reportComment: newReportComment,
            added: false,
          };

          await reportTools.updateReport(url, reportTypes[i], reportsToProcess[r].id, reportData, jwt);
        }
        // Delay between processing each report
        await delay(process.env.SCRIPT_RV_DELAY);
      }
    } else {
      updateLog[`${reportTypes[i]}reports`] = { reportCount: count };
    }
  }
  // Push update log to CAPIv2
  let updateCount = true;
  let updateKeys = Object.keys(updateLog);

  for (let u = 0; u < updateKeys.length; u++) {
    if (updateKeys[u].includes('reports') === true) {
      if (updateLog[updateKeys[u]].reportCount === '0') {
        updateCount = false;
      } else {
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
    console.log(
      moment()
        .utc()
        .format() + ' - Logging Disabled'
    );

    // let updateLogData = {
    //   updateTime: moment().utc().format(),
    //   updateLog: updateLog
    // };

    // await updateAPILog(url, updateLogData, jwt);
    // console.log(moment().utc().format() + ' - Log sent');
  }
  console.log('>-------- End Script --------<');
};

// if (process.env.SCRIPT_RV === 'true') {
//   cron.schedule(process.env.SCRIPT_RV_CRON, () => {
//     processReports();
//   });
// } else {
//   console.log('This script has been disabled');
//   process.exit(0);
// }

processReports();
