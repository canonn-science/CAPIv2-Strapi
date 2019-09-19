const moment = require('moment');

// Preprocess Report Checks
const preprocessReport = async (reportChecked, report) => {
  // List of possible status options for report
  let reportStatus = {
    beta: 'declined',
    blacklisted: 'declined',
    network: 'issue',
    capiv2Type: 'issue',
    duplicate: 'duplicate',
    missingCoords: 'issue',
    edsmSystem: 'issue',
    edsmBody: 'issue',
    updated: 'updated',
    accepted: 'accepted',
  };

  // Validate report based on previous updates to reportChecks

  // invalid for missing data
  if (
    !report.systemName ||
    !report.bodyName ||
    !report.latitude ||
    !report.longitude ||
    !report.type ||
    !report.cmdrName
  ) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'Report is missing key required information';
    reportChecked.valid.reportStatus = reportStatus.network;
    return reportChecked;
  }

  // Accept Checks
  if (
    reportChecked.isBeta === false &&
    reportChecked.blacklists.cmdr.checked === true &&
    reportChecked.blacklists.cmdr.blacklisted === false &&
    reportChecked.blacklists.client.checked === true &&
    reportChecked.blacklists.client.blacklisted === false &&
    reportChecked.capiv2.system.checked === true &&
    reportChecked.capiv2.body.checked === true &&
    reportChecked.capiv2.type.checked === true &&
    reportChecked.capiv2.type.exists === true &&
    reportChecked.capiv2.cmdr.checked === true &&
    reportChecked.capiv2.duplicate.isDuplicate === false &&
    reportChecked.capiv2.duplicate.createSite === true &&
    (
      reportChecked.capiv2.system.exists === true ||
      (
        reportChecked.edsm.system.exists === true &&
        reportChecked.edsm.system.hasCoords === true
      )
    ) && (
      reportChecked.capiv2.body.exists === true ||
      reportChecked.edsm.body.exists === true
    )
  ) {
    reportChecked.valid.isValid = true;
    reportChecked.valid.reason = `Report was accepted on [${moment().utc().format('YYYY-MM-DD hh:mm:ss')}]`;
    reportChecked.valid.reportStatus = reportStatus.accepted;
    return reportChecked;
  }

  // Update Checks
  if (
    reportChecked.isBeta === false &&
    reportChecked.blacklists.cmdr.checked === true &&
    reportChecked.blacklists.cmdr.blacklisted === false &&
    reportChecked.blacklists.client.checked === true &&
    reportChecked.blacklists.client.blacklisted === false &&
    reportChecked.capiv2.system.checked === true &&
    reportChecked.capiv2.body.checked === true &&
    reportChecked.capiv2.type.checked === true &&
    reportChecked.capiv2.type.exists === true &&
    reportChecked.capiv2.cmdr.checked === true &&
    reportChecked.capiv2.duplicate.updateSite === true &&
    reportChecked.capiv2.duplicate.isDuplicate === true &&
    (
      reportChecked.capiv2.system.exists === true ||
      (
        reportChecked.edsm.system.exists === true &&
        reportChecked.edsm.system.hasCoords === true
      )
    ) && (
      reportChecked.capiv2.body.exists === true ||
      reportChecked.edsm.body.exists === true
    )
  ) {
    reportChecked.valid.isValid = true;
    reportChecked.valid.reason = `Report was used to update site on [${moment().utc().format('YYYY-MM-DD hh:mm:ss')}]`;
    reportChecked.valid.reportStatus = reportStatus.updated;
    return reportChecked;
  }

  // isBeta
  if (reportChecked.isBeta === true) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'Report was from a Beta version';
    reportChecked.valid.reportStatus = reportStatus.beta;
    return reportChecked;
  }

  // blacklists
  if (reportChecked.blacklists.cmdr.blacklisted === true) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'CMDR is blacklisted';
    reportChecked.valid.reportStatus = reportStatus.blacklisted;
    return reportChecked;
  } else if (reportChecked.blacklists.cmdr.checked === false) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'Issue with checking blacklist';
    reportChecked.valid.reportStatus = reportStatus.network;
    return reportChecked;
  } else if (reportChecked.blacklists.client.blacklisted === true) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'Client is blacklisted';
    reportChecked.valid.reportStatus = reportStatus.blacklisted;
    return reportChecked;
  } else if (reportChecked.blacklists.cmdr.checked === false) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'Issue with checking blacklist';
    reportChecked.valid.reportStatus = reportStatus.network;
    return reportChecked;
  }

  // CAPIv2
  if (
    reportChecked.capiv2.system.checked === false ||
    reportChecked.capiv2.body.checked === false ||
    reportChecked.capiv2.type.checked === false ||
    reportChecked.capiv2.cmdr.checked === false
  ) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'Issue with checking CAPIv2 API Data';
    reportChecked.valid.reportStatus = reportStatus.network;
    return reportChecked;
  } else if (reportChecked.capiv2.type.exists === false) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'Type does not match approved types';
    reportChecked.valid.reportStatus = reportStatus.capiv2Type;
    return reportChecked;
  } else if (
    reportChecked.capiv2.duplicate.createSite === false &&
    reportChecked.capiv2.duplicate.checkedHaversine === false
  ) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'Unable to check duplicate based on haversine, missing radius or lat/lon';
    reportChecked.valid.reportStatus = reportStatus.network;
    return reportChecked;
  } else if (
    reportChecked.capiv2.duplicate.isDuplicate === true &&
    reportChecked.capiv2.duplicate.updateSite === false
  ) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = `Site is a duplicate of Site: ${
      reportChecked.capiv2.duplicate.site.id
    } at a distance of ${reportChecked.capiv2.duplicate.distance.toFixed(2)} Km`;
    reportChecked.valid.reportStatus = reportStatus.duplicate;
    return reportChecked;
  }

  // EDSM
  if (reportChecked.edsm.system.checked === false || reportChecked.edsm.body.checked === false) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'Unable to check EDSM due to a network error';
    reportChecked.valid.reportStatus = reportStatus.network;
    return reportChecked;
  } else if (reportChecked.edsm.system.exists === true && reportChecked.edsm.system.hasCoords === false) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'System exists in EDSM but has no Coords (Console user?)';
    reportChecked.valid.reportStatus = reportStatus.missingCoords;
    return reportChecked;
  } else if (reportChecked.capiv2.system.exists === false && reportChecked.edsm.system.exists === false) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'System does not exist in CAPIv2 or EDSM';
    reportChecked.valid.reportStatus = reportStatus.edsmSystem;
    return reportChecked;
  } else if (reportChecked.capiv2.body.exists === false && reportChecked.edsm.body.exists === false) {
    reportChecked.valid.isValid = false;
    reportChecked.valid.reason = 'Body does not exist in CAPIv2 or EDSM';
    reportChecked.valid.reportStatus = reportStatus.edsmBody;
    return reportChecked;
  }

  return reportChecked;

};

module.exports = { preprocessReport };

