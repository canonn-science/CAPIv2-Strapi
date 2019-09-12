const moment = require('moment');
const cron = require('node-cron');
require('node-json-color-stringify');
require('dotenv').config({ path: require('find-config')('.env') });
const delay = ms => new Promise(res => setTimeout(res, ms));
const logTime = moment().utc().format();

const capiLogin = require('./modules/capi/scriptModule_login');
const reportTools = require('./modules/capi/scriptModule_report');
const reportValid = require('./modules/validate/scriptModule_validateReport');

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
let reportTypes = ['ap', 'bt', 'cs', 'fg', 'fm', 'gv', 'gy', 'ls', 'tb', 'tw'];

// Update log with changes made
const updateAPILog = async data => {};

// Core function that calls all others for validation
const processReports = async () => {
  // Clean update log
  let updateLog = {};

  console.log(logTime + ' - Logging into CAPIv2');
  jwt = await capiLogin.login(url, process.env.SCRIPT_USER, process.env.SCRIPT_PASS);

  if (!jwt){
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
        console.log(logTime +  ` - Processing ${reportTypes[i]}report ID: ${reportsToProcess[r].id}`);

        // Validate Reports
        let reportChecked = await reportValid.validateReport(url, reportTypes[i], reportsToProcess[r]);

        console.log(reportChecked);

        // Push reportLog into UpdateLog
        (updateLog[`${reportTypes[i]}reports`].reports = updateLog[`${reportTypes[i]}reports`].reports || []).push(
          reportChecked
        );
        //console.log(updateLog);

        // if (reportChecked.valid.isValid === false) {
        //   // Update report
        //   let newReportComment = `[${reportChecked.valid.reportStatus.toUpperCase()}] - ${
        //     reportChecked.valid.reportComment
        //   }`;

        //   let dupSiteID = null;
        //   if (reportChecked.capiv2.duplicate.isDuplicate === true && reportChecked.capiv2.duplicate.site !== null) {
        //     dupSiteID = reportChecked.capiv2.duplicate.site.id;
        //   } else {
        //     dupSiteID = null;
        //   }

        //   let reportData = {
        //     reportStatus: reportChecked.valid.reportStatus,
        //     reportComment: newReportComment,
        //     added: false,
        //     site: dupSiteID,
        //   };

        //   await updateReport(reportTypes[i], reportChecked.reportID, reportData);
        //   console.log(
        //     moment()
        //       .utc()
        //       .format() + ` - Updated invalid ${reportTypes[i]}report ID: ${reportsToProcess[r].id}`
        //   );
        // } else {
        //   // create system or use existing
        //   let newSystem = {};
        //   if (reportChecked.capiv2.system.exists === false && reportChecked.capiv2.system.checked === true) {
        //     let systemData = {};
        //     if (
        //       reportChecked.edsm.system.checked === true &&
        //       reportChecked.edsm.system.exists === true &&
        //       reportChecked.edsm.system.hasCoords === true
        //     ) {
        //       systemData = {
        //         systemName: reportChecked.edsm.system.data.name.toUpperCase(),
        //         id64: reportChecked.edsm.system.data.id64,
        //         edsmID: reportChecked.edsm.system.data.id,
        //         edsmCoordX: reportChecked.edsm.system.data.coords.x,
        //         edsmCoordY: reportChecked.edsm.system.data.coords.y,
        //         edsmCoordZ: reportChecked.edsm.system.data.coords.z,
        //         edsmCoordLocked: reportChecked.edsm.system.data.coordsLocked,
        //         primaryStar: reportChecked.edsm.system.data.primaryStar,
        //       };
        //     } else {
        //       systemData = {
        //         systemName: reportsToProcess[r].systemName.toUpperCase(),
        //       };
        //     }
        //     newSystem = await createSystem(systemData);
        //     // Push new system into log
        //     (updateLog.systems = updateLog.systems || []).push(newSystem);
        //   } else {
        //     newSystem = reportChecked.capiv2.system.data;
        //   }

        //   // create body, assign system, or use existing
        //   let newBody = {};
        //   if (reportChecked.capiv2.body.exists === false && reportChecked.capiv2.body.checked === true) {
        //     let bodyData = {};
        //     if (reportChecked.edsm.body.checked === true && reportChecked.edsm.body.exists === true) {
        //       bodyData = reportChecked.edsm.body.data;
        //       newBody = await createBody(newSystem.id, reportChecked.edsm.body.data.name, bodyData);
        //       // Push new system into log
        //       (updateLog.bodies = updateLog.bodies || []).push(newBody);
        //     }
        //   } else {
        //     newBody = reportChecked.capiv2.body.data;
        //   }

        //   // create cmdr or use existing
        //   let newCMDR = {};
        //   if (reportChecked.capiv2.cmdr.exists === false && reportChecked.capiv2.cmdr.checked === true) {
        //     newCMDR = await createCMDR(reportsToProcess[r].cmdrName);
        //   } else {
        //     newCMDR = reportChecked.capiv2.cmdr.data;
        //   }

        //   // create/update site, assign system, body, type, and cmdr
        //   let newSite = {};
        //   if (
        //     reportChecked.capiv2.duplicate.isDuplicate === false &&
        //     reportChecked.capiv2.duplicate.createSite === true
        //   ) {
        //     let siteData = {
        //       system: newSystem.id,
        //       body: newBody.id,
        //       latitude: reportsToProcess[r].latitude,
        //       longitude: reportsToProcess[r].longitude,
        //       type: reportChecked.capiv2.type.data.id,
        //       frontierID: reportsToProcess[r].frontierID,
        //       verified: false,
        //       visible: true,
        //       discoveredBy: newCMDR.id,
        //     };

        //     newSite = await createSite(reportTypes[i], siteData);
        //   }

        //   // Update report
        //   let newReportComment = `[${reportChecked.valid.reportStatus.toUpperCase()}] - ${
        //     reportChecked.valid.reportComment
        //   }`;

        //   let reportData = {
        //     reportStatus: reportChecked.valid.reportStatus,
        //     reportComment: newReportComment,
        //     added: true,
        //     site: newSite.id,
        //   };

        //   await updateReport(reportTypes[i], reportChecked.reportID, reportData);
        //   console.log(
        //     moment()
        //       .utc()
        //       .format() + ` - Updated invalid ${reportTypes[i]}report ID: ${reportsToProcess[r].id}`
        //   );
        // }
        // // Delay between processing each report
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
