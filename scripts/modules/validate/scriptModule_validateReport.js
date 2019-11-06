const blacklistTools = require('../capi/scriptModule_blacklist');
const bodyTools = require('../capi/scriptModule_body');
const cmdrTools = require('../capi/scriptModule_cmdr');
const edsm = require('../edsm/scriptModule_edsm');
const duplicateTools = require('./scriptModule_haversine');
const processTools = require('./scriptModule_preprocessReport');
const siteTools = require('../capi/scriptModule_site');
const systemTools = require('../capi/scriptModule_system');
const typeTools = require('../capi/scriptModule_type');

// Validate reports to ensure they have all the needed data
const validateReport = async (url, reportType, report) => {
  let reportChecks = {
    reportType: reportType + 'reports',
    reportID: report.id,
    valid: {
      isValid: false,
      reason: null,
      reportStatus: null,
    },
    isBeta: true,
    blacklists: {
      cmdr: {
        checked: false,
        blacklisted: true,
      },
      client: {
        checked: false,
        blacklisted: true,
      },
    },
    capiv2: {
      system: {
        add: false,
        checked: false,
        exists: false,
        data: null,
      },
      body: {
        add: false,
        checked: false,
        exists: false,
        data: null,
      },
      type: {
        checked: false,
        exists: false,
        data: null,
      },
      cmdr: {
        add: false,
        checked: false,
        exists: false,
        data: null,
      },
      duplicate: {
        createSite: false,
        updateSite: false,
        checkedHaversine: false,
        // Pending new Frontier update
        //checkedFrontierID: false
        isDuplicate: true,
        distance: null,
        site: null,
      },
    },
    edsm: {
      system: {
        checked: false,
        exists: false,
        hasCoords: false,
        data: null,
      },
      body: {
        checked: false,
        exists: false,
        data: null,
      },
    },
  };

  // make sure the report isn't from beta
  if (report.isBeta === true) {
    reportChecks.isBeta = true;
    // Preprocess Report Validation
    let processedReportChecks = await processTools.preprocessReport(reportChecks, report);

    // Return data to reportValidator to execute tasks
    return processedReportChecks;
  } else {
    reportChecks.isBeta = false;
  }

  // check cmdr blacklist
  let checkCMDR = await blacklistTools.checkBlacklist(url, 'cmdr', report.cmdrName);

  if (!Array.isArray(checkCMDR) || !checkCMDR.length) {
    reportChecks.blacklists.cmdr.checked = true;
    reportChecks.blacklists.cmdr.blacklisted = false;
  } else {
    for (let i = 0; i < checkCMDR.length; i++) {
      if (report.cmdrName == checkCMDR[i].cmdrName) {
        reportChecks.blacklists.cmdr.checked = true;
        reportChecks.blacklists.cmdr.blacklisted = true;
        // Preprocess Report Validation
        let processedReportChecks = await processTools.preprocessReport(reportChecks, report);

        // Return data to reportValidator to execute tasks
        return processedReportChecks;
      }
    }
  }

  // check client blacklist
  let checkClient = await blacklistTools.checkBlacklist(url, 'client', report.clientVersion);

  if (!Array.isArray(checkClient) || !checkClient.length) {
    reportChecks.blacklists.client.checked = true;
    reportChecks.blacklists.client.blacklisted = false;
  } else {
    for (let i = 0; i < checkClient.length; i++) {
      if (report.clientVersion == checkClient[i].clientVersion) {
        reportChecks.blacklists.client.checked = true;
        reportChecks.blacklists.client.blacklisted = true;
        // Preprocess Report Validation
        let processedReportChecks = await processTools.preprocessReport(reportChecks, report);

        // Return data to reportValidator to execute tasks
        return processedReportChecks;
      }
    }
  }

  // check capiv2 for system
  let checkCAPISystem = await systemTools.getSystem(url, report.systemName);

  if (!Array.isArray(checkCAPISystem) || !checkCAPISystem.length) {
    reportChecks.capiv2.system.checked = true;
    reportChecks.capiv2.system.exists = false;
    reportChecks.capiv2.system.add = true;
  } else {
    for (let i = 0; i < checkCAPISystem.length; i++) {
      if (report.systemName.toUpperCase() == checkCAPISystem[i].systemName.toUpperCase()) {
        reportChecks.capiv2.system.checked = true;
        reportChecks.capiv2.system.exists = true;
        reportChecks.capiv2.system.data = checkCAPISystem[i];
      }
    }
  }

  // check capiv2 for body
  let checkCAPIBody = await bodyTools.getBody(url, report.bodyName);

  if (!Array.isArray(checkCAPIBody) || !checkCAPIBody.length) {
    reportChecks.capiv2.body.checked = true;
    reportChecks.capiv2.body.exists = false;
    reportChecks.capiv2.body.add = true;
  } else {
    for (let i = 0; i < checkCAPIBody.length; i++) {
      if (report.bodyName.toUpperCase() == checkCAPIBody[i].bodyName.toUpperCase()) {
        reportChecks.capiv2.body.checked = true;
        reportChecks.capiv2.body.exists = true;
        reportChecks.capiv2.body.data = checkCAPIBody[i];
      }
    }
  }

  // check capiv2 for type
  let checkCAPIType = await typeTools.getType(url, reportType, report.type);

  if (!Array.isArray(checkCAPIType) || !checkCAPIType.length) {
    reportChecks.capiv2.type.checked = true;
    reportChecks.capiv2.type.exists = false;
    // Preprocess Report Validation
    let processedReportChecks = await processTools.preprocessReport(reportChecks, report);

    // Return data to reportValidator to execute tasks
    return processedReportChecks;
  } else {
    for (let i = 0; i < checkCAPIType.length; i++) {
      if (report.type == checkCAPIType[i].type) {
        reportChecks.capiv2.type.checked = true;
        reportChecks.capiv2.type.exists = true;
        reportChecks.capiv2.type.data = checkCAPIType[i];
      } else if (report.type == checkCAPIType[i].journalName) {
        reportChecks.capiv2.type.checked = true;
        reportChecks.capiv2.type.exists = true;
        reportChecks.capiv2.type.data = checkCAPIType[i];
      }
    }
  }

  // check capiv2 for cmdr
  let checkCAPICMDR = await cmdrTools.getCMDR(url, report.cmdrName);

  if (!Array.isArray(checkCAPICMDR) || !checkCAPICMDR.length) {
    reportChecks.capiv2.cmdr.checked = true;
    reportChecks.capiv2.cmdr.exists = false;
    reportChecks.capiv2.cmdr.add = true;
  } else {
    for (let i = 0; i < checkCAPICMDR.length; i++) {
      if (report.cmdrName.toLowerCase() == checkCAPICMDR[i].cmdrName.toLowerCase()) {
        reportChecks.capiv2.cmdr.checked = true;
        reportChecks.capiv2.cmdr.exists = true;
        reportChecks.capiv2.cmdr.data = checkCAPICMDR[i];
      }
    }
  }

  // check edsm for system
  let checkEDSMSystem = await edsm.getSystemEDSM(report.systemName);

  if (Object.keys(checkEDSMSystem).length < 1) {
    reportChecks.edsm.system.checked = true;
    reportChecks.edsm.system.exists = false;
    // Preprocess Report Validation
    let processedReportChecks = await processTools.preprocessReport(reportChecks, report);

    // Return data to reportValidator to execute tasks
    return processedReportChecks;
  } else {
    if (report.systemName.toUpperCase() == checkEDSMSystem.name.toUpperCase()) {
      reportChecks.edsm.system.checked = true;
      reportChecks.edsm.system.exists = true;
      reportChecks.edsm.system.data = checkEDSMSystem;
      if (checkEDSMSystem.coords) {
        reportChecks.edsm.system.hasCoords = true;
      }
    }
  }

  // check edsm for body
  let checkEDSMBody = await edsm.getBodyEDSM(report.systemName);

  if (!Array.isArray(checkEDSMBody.bodies) || !checkEDSMBody.bodies.length) {
    reportChecks.edsm.body.checked = true;
    reportChecks.edsm.body.exists = false;
    // Preprocess Report Validation
    let processedReportChecks = await processTools.preprocessReport(reportChecks, report);

    // Return data to reportValidator to execute tasks
    return processedReportChecks;
  } else {
    for (let i = 0; i < checkEDSMBody.bodies.length; i++) {
      if (report.bodyName.toUpperCase() == checkEDSMBody.bodies[i].name.toUpperCase()) {
        reportChecks.edsm.body.checked = true;
        reportChecks.edsm.body.exists = true;
        reportChecks.edsm.body.data = checkEDSMBody.bodies[i];
      }
    }
    if (reportChecks.edsm.body.exists === false) {
      reportChecks.capiv2.duplicate.isDuplicate = false;
      reportChecks.edsm.body.checked = true;
      reportChecks.edsm.body.exists = false;
      // Preprocess Report Validation
      let processedReportChecks = await processTools.preprocessReport(reportChecks, report);

      // Return data to reportValidator to execute tasks
      return processedReportChecks;
    }
  }

  // check capiv2 for duplicate
  let checkCAPISite = await siteTools.getSites(url, reportType, report.bodyName);

  if (!Array.isArray(checkCAPISite) || !checkCAPISite.length) {
    reportChecks.capiv2.duplicate.createSite = true;
    reportChecks.capiv2.duplicate.checkedHaversine = false;
    reportChecks.capiv2.duplicate.isDuplicate = false;
  } else {
    for (let i = 0; i < checkCAPISite.length; i++) {
      if (!report.latitude || !report.longitude || (report.latitude == 0 && report.longitude == 0)) {
        reportChecks.capiv2.duplicate.checkedHaversine = false;
        reportChecks.capiv2.duplicate.isDuplicate = false;
        // Preprocess Report Validation
        let processedReportChecks = await processTools.preprocessReport(reportChecks, report);

        // Return data to reportValidator to execute tasks
        return processedReportChecks;
      } else if (
        report.systemName.toUpperCase() === checkCAPISite[i].system.systemName.toUpperCase() &&
        report.bodyName.toUpperCase() === checkCAPISite[i].body.bodyName.toUpperCase() &&
        report.latitude &&
        report.longitude &&
        (checkCAPISite[i].body.radius ||
          reportChecks.edsm.body.data.radius ||
          (report.frontierID !== null && report.frontierID === checkCAPISite[i].frontierID))
      ) {
        // Pulling Radius from CAPIv2 or EDSM
        let tempRadius = null;
        if (checkCAPISite[i].body.radius) {
          tempRadius = checkCAPISite[i].body.radius;
        } else if (reportChecks.edsm.body.data.radius) {
          tempRadius = reportChecks.edsm.body.data.radius;
        } else {
          reportChecks.capiv2.duplicate.checkedHaversine = false;
          reportChecks.capiv2.duplicate.isDuplicate = true;
          // Preprocess Report Validation
          let processedReportChecks = await processTools.preprocessReport(reportChecks, report);

          // Return data to reportValidator to execute tasks
          return processedReportChecks;
        }

        // Haversine Check
        if (tempRadius !== null) {
          let distance = await duplicateTools.haversine(
            {
              latitude: checkCAPISite[i].latitude,
              longitude: checkCAPISite[i].longitude,
            },
            {
              latitude: report.latitude,
              longitude: report.longitude,
            },
            tempRadius
          );

          if (distance > process.env.SCRIPT_RV_DUPRANGE) {
            reportChecks.capiv2.duplicate.checkedHaversine = true;
            reportChecks.capiv2.duplicate.isDuplicate = false;
            reportChecks.capiv2.duplicate.createSite = true;
            reportChecks.capiv2.duplicate.site = null;
          } else {
            reportChecks.capiv2.duplicate.checkedHaversine = true;
            reportChecks.capiv2.duplicate.isDuplicate = true;
            reportChecks.capiv2.duplicate.distance = distance;
            reportChecks.capiv2.duplicate.site = checkCAPISite[i];
          }
        }

        // Check if Site can be updated
        if (
          checkCAPISite[i] &&
          report.type !== checkCAPISite[i].type.type &&
          reportChecks.capiv2.duplicate.createSite !== true
        ) {
          reportChecks.capiv2.duplicate.updateSite = true;
          reportChecks.capiv2.duplicate.site = checkCAPISite[i];
        }
        if (
          checkCAPISite[i] &&
          report.frontierID !== checkCAPISite[i].frontierID &&
          checkCAPISite[i].frontierID === null &&
          report.frontierID &&
          reportChecks.capiv2.duplicate.createSite !== true
        ) {
          reportChecks.capiv2.duplicate.updateSite = true;
          reportChecks.capiv2.duplicate.site = checkCAPISite[i];
        }
        if (
          (
            checkCAPISite[i].discoveredBy === null ||
            checkCAPISite[i].discoveredBy === 618
          ) &&
          report.cmdrName &&
          reportChecks.capiv2.duplicate.createSite !== true
        ) {
          reportChecks.capiv2.duplicate.updateSite = true;
          reportChecks.capiv2.duplicate.site = checkCAPISite[i];
        }
      }
    }
  }

  if (reportChecks.capiv2.duplicate.isDuplicate === true) {
    reportChecks.capiv2.duplicate.createSite = false;
  }

  if (!reportChecks.capiv2.duplicate.site) {
    reportChecks.capiv2.duplicate.createSite === true;
  }

  if (reportChecks.capiv2.duplicate.createSite === true) {
    reportChecks.capiv2.duplicate.updateSite = false;
  }

  // Preprocess Report Validation
  let processedReportChecks = await processTools.preprocessReport(reportChecks, report);

  // Return data to reportValidator to execute tasks
  return processedReportChecks;
};

module.exports = { validateReport };
