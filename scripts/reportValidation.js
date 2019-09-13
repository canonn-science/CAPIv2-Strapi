const moment = require('moment');
const cron = require('node-cron');
require('node-json-color-stringify');
require('dotenv').config({ path: require('find-config')('.env') });
const delay = ms => new Promise(res => setTimeout(res, ms));
const logTime = moment()
  .utc()
  .format();

const capiLogin = require('./modules/capi/scriptModule_login');
const reportTools = require('./modules/capi/scriptModule_report');
const reportValid = require('./modules/validate/scriptModule_validateReport');
const systemTools = require('./modules/capi/scriptModule_system');
const bodyTools = require('./modules/capi/scriptModule_body');
const siteTools = require('./modules/capi/scriptModule_site');
const systemproTools = require('./modules/data_processing/scriptModule_system');
const bodyproTools = require('./modules/data_processing/scriptModule_body');

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

// Update log with changes made
const updateAPILog = async data => {};

// Core function that calls all others for validation
const processReports = async () => {
  // Clean update log
  let updateLog = {};

  console.log(logTime + ' - Logging into CAPIv2');
  jwt = await capiLogin.login(url, process.env.SCRIPT_USER, process.env.SCRIPT_PASS);

  if (!jwt) {
    console.log('LOGIN FAILED!');
    process.exit(1);
  } else {
    console.log('Successfully Logged in!');
  }

  // Start processing
  console.log(logTime + ' - Starting to process reports');

  // Get counts to check if we need to process reports for that site type
  for (let i = 0; i < reportTypes.length; i++) {
    let count = await reportTools.getCount(url, reportTypes[i], 'pending');

    // If count is more than zero, fetch reports and start processing them
    if (count > 0) {
      // Start report processing
      console.log(logTime + ` - Running Validation on ${reportTypes[i]}reports`);
      updateLog[`${reportTypes[i]}reports`] = { reportCount: count };

      let reportsToProcess = await reportTools.getReports(url, reportTypes[i], 'pending');

      // Loop through reports and process one by one
      for (let r = 0; r < reportsToProcess.length; r++) {
        console.log(logTime + ` - Processing ${reportTypes[i]}report ID: ${reportsToProcess[r].id}`);

        // Validate Reports
        let reportChecked = await reportValid.validateReport(url, reportTypes[i], reportsToProcess[r]);


        // Push reportLog into UpdateLog
        (updateLog[`${reportTypes[i]}reports`].reports = updateLog[`${reportTypes[i]}reports`].reports || []).push(
          reportChecked
        );

        // Checking for createSite or updateSite
        if (
          reportChecked.valid.isValid === true &&
          reportChecked.capiv2.duplicate.updateSite === true
        ) {
          // perform update logic
          // Check if System needs to be updated
          if (
            (reportChecked.capiv2.system.data.edsmCoordLocked === false &&
              reportChecked.edsm.system.data.coordsLocked === true) ||
            (!reportChecked.capiv2.system.data.edsmID && reportChecked.edsm.system.data.id)
          ) {
            let systemData = await systemproTools.processSystem(url, 'edsm', reportChecked.edsm.system.data);
            await systemTools.updateSystem(url, reportChecked.capiv2.system.data.id, systemData, jwt);
          }

          // Check if Body needs to be updated
          if (!reportChecked.capiv2.body.data.edsmID && reportChecked.edsm.body.data.id) {
            let bodyData = await bodyproTools.processBody(url, 'edsm', reportChecked.edsm.body.data);
            await bodyTools.updateBody(url, reportChecked.capiv2.body.data.id, bodyData, jwt);
          }

          // Update site by ID
          var updatedSite;
          let toUpdate = false;
          let siteData = {
            type: reportChecked.capiv2.duplicate.site.type,
            frontierID: reportChecked.capiv2.duplicate.site.frontierID
          };

          if (reportChecked.capiv2.duplicate.site.type.type !== reportsToProcess[r].type) {
            siteData.type = reportChecked.capiv2.type.data.id;
            toUpdate = true;
          }

          if (reportChecked.capiv2.duplicate.site.frontierID !== reportsToProcess[r].frontierID) {
            siteData.frontierID = reportsToProcess[r].frontierID;
            toUpdate = true;
          }

          if (toUpdate === false) {
            updatedSite = reportChecked.capiv2.duplicate.site.data;
          } else {
            updatedSite = await siteTools.updateSite(
              url,
              reportTypes[i],
              reportChecked.capiv2.duplicate.site.id,
              siteData,
              jwt
            );
          }

          // Update the report
          let newReportComment = `[${reportChecked.valid.reportStatus.toUpperCase()}] - ${
            reportChecked.valid.reason
          }`;
          let updatedReport = {
            reportStatus: reportChecked.valid.reportStatus,
            reportComment: newReportComment,
            added: false,
            site: reportChecked.capiv2.duplicate.site.id,
          };

          // Push updated report

          console.log(logTime + ' - Report Marked for Site Update');
          await reportTools.updateReport(url, reportTypes[i], reportsToProcess[r].id, updatedReport, jwt);
        } else if (reportChecked.valid.isValid === true && reportChecked.capiv2.duplicate.createSite === true) {
          //perform create logic
          console.log(reportChecked);
          console.log('CREATE LOGIC');

          // Create System if needed

          // Create Body if needed

          // Create CMDR if needed


        } else if (reportChecked.valid.isValid === false) {
          // perform failure logic
          console.log(reportChecked);
          console.log('FAIL LOGIC');
          console.log(reportChecked.valid.reason);
          console.log(reportChecked.valid.reportStatus);
        }
        // Delay between processing each report
        await delay(process.env.SCRIPT_RV_DELAY);
      }
    } else {
      updateLog[`${reportTypes[i]}reports`] = { reportCount: count };
    }
  }
  // Push update log to CAPIv2
  console.log(updateLog);
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
