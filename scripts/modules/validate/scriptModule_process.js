const delay = ms => new Promise(res => setTimeout(res, ms));
const reportTools = require('../capi/scriptModule_report');
const systemTools = require('../capi/scriptModule_system');
const bodyTools = require('../capi/scriptModule_body');
const siteTools = require('../capi/scriptModule_site');
const cmdrTools = require('../capi/scriptModule_cmdr');
const systemproTools = require('../data_processing/scriptModule_system');
const bodyproTools = require('../data_processing/scriptModule_body');

const create = async (url, jwt, reportType, reportChecked, reportToProcess) => {
  // Define variables
  var systemID;
  var bodyID;
  var cmdrID;
  var siteID;
  let updateLog = {
    system: null,
    body: null,
    cmdr: null,
    site: null,
    report: null,
  };

  // Create System if needed
  if (reportChecked.capiv2.system.exists === true) {
    systemID = reportChecked.capiv2.system.data.id;
  } else if (reportChecked.capiv2.system.exists === false && reportChecked.edsm.system.exists === true) {
    let systemData = await systemproTools.processSystem(url, 'edsm', reportChecked.edsm.system.data);
    let newSystem = await systemTools.createSystem(url, systemData, jwt);

    if (newSystem.systemName === reportToProcess.systemName.toUpperCase()) {
      systemID = newSystem.id;
      // Push newSystem into UpdateLog
      updateLog.system = systemID;
    } else {
      console.log('ERROR WITH NEW SYSTEM! Error Code: 1');
      systemID = 'FAILED';
    }
  } else {
    console.log('ERROR WITH NEW SYSTEM! Error Code: 2');
    systemID = 'FAILED';
  }

  // Create Body if needed
  if (reportChecked.capiv2.body.exists === true) {
    bodyID = reportChecked.capiv2.body.data.id;
  } else if (
    reportChecked.capiv2.body.exists === false &&
    reportChecked.edsm.body.exists === true &&
    (systemID !== 'FAILED' || typeof systemID !== 'undefined')
  ) {
    let bodyData = await bodyproTools.processBody('edsm', reportChecked.edsm.body.data, await systemID);
    let newBody = await bodyTools.createBody(url, bodyData, jwt);

    if (newBody.bodyName === reportToProcess.bodyName.toUpperCase() && newBody.system.id === systemID) {
      bodyID = newBody.id;
      // Push newBody into UpdateLog
      updateLog.body = bodyID;
    } else {
      console.log('ERROR WITH NEW BODY! Error Code: 1');
      bodyID = 'FAILED';
    }
  } else {
    console.log('ERROR WITH NEW BODY! Error Code: 2');
    bodyID = 'FAILED';
  }

  // Create CMDR if needed
  if (reportChecked.capiv2.cmdr.exists === true) {
    cmdrID = reportChecked.capiv2.cmdr.data.id;
  } else {
    let cmdrData = {
      cmdrName: reportToProcess.cmdrName,
    };
    let newCMDR = await cmdrTools.createCMDR(url, cmdrData, jwt);

    if (newCMDR.cmdrName === reportToProcess.cmdrName) {
      cmdrID = newCMDR.id;
      // Push newCMDR into UpdateLog
      updateLog.cmdr = cmdrID;
    } else {
      console.log('ERROR WITH NEW CMDR! Error Code: 1');
      cmdrID = 'FAILED';
    }
  }

  // Create Site
  if (
    systemID &&
    bodyID &&
    cmdrID &&
    (systemID !== 'FAILED' || typeof systemID !== 'undefined') &&
    (bodyID !== 'FAILED' || typeof bodyID !== 'undefined') &&
    (cmdrID !== 'FAILED' || typeof cmdrID !== 'undefined') &&
    reportChecked.capiv2.type.exists === true
  ) {
    let siteData = {
      system: systemID,
      body: bodyID,
      discoveredBy: cmdrID,
      type: reportChecked.capiv2.type.data.id,
      latitude: reportToProcess.latitude,
      longitude: reportToProcess.longitude,
      frontierID: reportToProcess.frontierID,
      verified: false,
      visible: true,
    };

    let newSite = await siteTools.createSite(url, reportType, siteData, jwt);

    await delay(100);

    if (
      newSite.system.id === (await systemID) &&
      newSite.body.id === (await bodyID) &&
      newSite.type.id === reportChecked.capiv2.type.data.id &&
      newSite.latitude === reportToProcess.latitude &&
      newSite.longitude === reportToProcess.longitude
    ) {
      siteID = newSite.id;
      // Push newSite into UpdateLog
      updateLog.site = siteID;
    } else {
      console.log('ERROR WITH NEW SITE! Error Code: 1');
      siteID = 'FAILED';
    }
  }

  // Update Report
  if (siteID !== 'FAILED' || typeof siteID !== 'undefined') {
    let newReportComment = `[${reportChecked.valid.reportStatus.toUpperCase()}] - ${reportChecked.valid.reason}`;
    let reportData = {
      reportStatus: reportChecked.valid.reportStatus,
      reportComment: newReportComment,
      added: true,
      site: siteID,
    };

    let finalReport = await reportTools.updateReport(url, reportType, reportToProcess.id, reportData, jwt);

    if (
      finalReport.reportStatus !== reportChecked.valid.reportStatus ||
      finalReport.reportComment !== newReportComment ||
      finalReport.site.id === null
    ) {
      console.log('ERROR WITH UPDATED REPORT! Error Code: 1');
    } else {
      updateLog.report = finalReport.id;
    }
  } else {
    console.log('ERROR WITH UPDATED REPORT! Error Code: 2');
  }

  return updateLog;
};

const update = async (url, jwt, reportType, reportChecked, reportToProcess) => {
  // Define variables
  var updateSystemID;
  var updateBodyID;
  var updateCmdrID;
  var updateSiteID;
  var updatedReportID;
  let updateLog = {
    system: null,
    body: null,
    cmdr: null,
    site: null,
    report: null,
  };

  // Check if System needs to be updated
  if (
    (reportChecked.capiv2.system.data.edsmCoordLocked === false &&
      reportChecked.edsm.system.data.coordsLocked === true) ||
    (!reportChecked.capiv2.system.data.edsmID && reportChecked.edsm.system.data.id)
  ) {
    let updateSystem = await systemTools.updateSystem(
      url,
      reportChecked.capiv2.system.data.id,
      await systemproTools.processSystem(url, 'edsm', reportChecked.edsm.system.data),
      jwt
    );
    updateSystemID = updateSystem.id;
    // Push updateSystem into UpdateLog
    updateLog.system = updateSystemID;
  }

  // Check if Body needs to be updated
  if (!reportChecked.capiv2.body.data.edsmID && reportChecked.edsm.body.data.id) {
    let updateBody = await bodyTools.updateBody(
      url,
      reportChecked.capiv2.body.data.id,
      await bodyproTools.processBody(url, 'edsm', reportChecked.edsm.body.data),
      jwt
    );
    updateBodyID = updateBody.id;
    // Push updateBody into UpdateLog
    updateLog.body = updateBodyID;
  }

  // Update site by ID
  let toUpdate = false;
  let siteData = {
    type: reportChecked.capiv2.duplicate.site.type,
    frontierID: reportChecked.capiv2.duplicate.site.frontierID,
    discoveredBy: reportChecked.capiv2.duplicate.site.discoveredBy,
  };

  if (reportChecked.capiv2.duplicate.site.type.type !== reportToProcess.type) {
    siteData.type = reportChecked.capiv2.type.data.id;
    toUpdate = true;
  }

  if (reportChecked.capiv2.duplicate.site.frontierID !== reportToProcess.frontierID) {
    siteData.frontierID = reportToProcess.frontierID;
    toUpdate = true;
  }

  if (
    reportChecked.capiv2.duplicate.site.discoveredBy === null ||
    reportChecked.capiv2.duplicate.site.discoveredBy.cmdrName === 'zzz_Unknown'
  ) {
    // Create CMDR if needed
    let cmdrData = {
      cmdrName: reportToProcess.cmdrName,
    };
    let newCMDR = await cmdrTools.createCMDR(url, cmdrData, jwt);

    if (newCMDR.cmdrName === reportToProcess.cmdrName) {
      updateCmdrID = newCMDR.id;
      // Push newCMDR into UpdateLog
      updateLog.cmdr = updateCmdrID;
    } else {
      console.log('ERROR WITH NEW CMDR! Error Code: 1');
      updateCmdrID = 'FAILED';
    }
  }

  if (toUpdate === false) {
    updateSiteID = reportChecked.capiv2.duplicate.site.id;
  } else {
    let updateSite = await siteTools.updateSite(
      url,
      reportType,
      reportChecked.capiv2.duplicate.site.id,
      siteData,
      jwt
    );
    updateSiteID = updateSite.id;
    // Push updateSite into UpdateLog
    updateLog.site = updateSiteID;
  }

  // Update the report
  let newReportComment = `[${reportChecked.valid.reportStatus.toUpperCase()}] - ${reportChecked.valid.reason}`;
  let reportData = {
    reportStatus: reportChecked.valid.reportStatus,
    reportComment: newReportComment,
    added: false,
    site: reportChecked.capiv2.duplicate.site.id,
  };

  // Push updated report
  let updatedReport = await reportTools.updateReport(
    url,
    reportType,
    reportToProcess.id,
    reportData,
    jwt
  );

  updatedReportID = updatedReport.id;
  // Push updateReport into UpdateLog
  updateLog.report = updatedReportID;

  return updateLog;
};

module.exports = { create, update };
