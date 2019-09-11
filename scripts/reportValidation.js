const fetch = require('node-fetch');
const moment = require('moment');
const cron = require('node-cron');
require('dotenv').config({ path: require('find-config')('.env') });
const delay = ms => new Promise(res => setTimeout(res, ms));

// Setting URL for each server
let url = null;
if (process.env.NODE_ENV == 'production') {
  url = process.env.SCRIPT_PROD;
} else if (process.env.NODE_ENV == 'staging') {
  url = process.env.SCRIPT_STAG;
} else {
  url = process.env.SCRIPT_DEV;
}

// Setting EDSM URLs
let edsmSystemURL = process.env.SCRIPT_RV_EDSMSYSTEM;
let edsmBodyURL = process.env.SCRIPT_RV_EDSMBODY;

// Declaring jwt as a variable and forming login function
let jwt = null;
const login = async () => {
  // set body information to .env options
  let body = {
    identifier: process.env.SCRIPT_USER,
    password: process.env.SCRIPT_PASS,
  };

  // try logging in or log the error
  try {
    const response = await fetch(url + '/auth/local', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(body),
    });

    // waiting for login response
    const json = await response.json();

    // set jwt after response is received
    jwt = json.jwt;
  } catch (error) {
    console.log(error);
  }
};

// Set report types that will be verified and converted to sites
let reportTypes = ['ap', 'bt', 'cs', 'fg', 'fm', 'gv', 'gy', 'ls', 'tb', 'tw'];

// List of possible status options for report
let reportStatus = {
  beta: 'declined',
  blacklisted: 'declined',
  capiv2Type: 'issue',
  duplicate: 'duplicate',
  missingCoords: 'issue',
  edsmSystem: 'issue',
  edsmBody: 'issue',
  accepted: 'accepted',
};

let haversine = async (p1, p2, radius) => {
  const phi_a = (p1.latitude * Math.PI) / 180;
  const lambda_a = (p1.longitude * Math.PI) / 180;

  const phi_b = (p2.latitude * Math.PI) / 180;
  const lambda_b = (p2.longitude * Math.PI) / 180;

  const radius_planet = radius;

  let d_lambda;
  let S_ab;
  let D_ab;

  if (phi_a != phi_b || lambda_b != lambda_a) {
    d_lambda = lambda_b - lambda_a;
    S_ab = Math.acos(Math.sin(phi_a) * Math.sin(phi_b) + Math.cos(phi_a) * Math.cos(phi_b) * Math.cos(d_lambda));
    D_ab = S_ab * radius_planet;
  } else {
    D_ab = 0;
  }

  return D_ab;
};

// Fetch EDSM to verify it exists and sync data to CAPIv2
let getSystemEDSM = async system => {
  try {
    const response = await fetch(edsmSystemURL + encodeURIComponent(system), {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    });

    let edsmResponse = {
      edsmSystem: await response.text(),
      edsmHTTPCode: await response.text()
    };
    return edsmResponse;
  } catch (error) {
    console.log(error);
  }
};

// Fetch EDSM to verify it exists and sync data to CAPIv2
let getBodyEDSM = async system => {
  try {
    const response = await fetch(edsmBodyURL + encodeURIComponent(system), {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    });

    let edsmBody = await response.text();
    return edsmBody;
  } catch (error) {
    console.log(error);
  }
};

// Get count of reports to see if we need to validate them
let getCount = async reportType => {
  try {
    const response = await fetch(url + `/${reportType}reports/count?reportStatus=pending`, {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    });

    let count = await response.text();
    return count;
  } catch (error) {
    console.log(error);
  }
};

// Check blacklists for CMDR Name
let checkCMDRBlacklist = async cmdr => {
  try {
    const response = await fetch(url + '/excludecmdrs?cmdrName=' + encodeURIComponent(cmdr), {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    });

    let cmdrBlacklistData = await response.json();
    return cmdrBlacklistData;
  } catch (error) {
    console.log(error);
  }
};

// Check blacklists for Client Version
let checkClientBlacklist = async clientVersion => {
  try {
    const response = await fetch(url + '/excludeclients?version=' + encodeURIComponent(clientVersion), {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    });

    let clientBlacklistData = await response.json();
    return clientBlacklistData;
  } catch (error) {
    console.log(error);
  }
};

// Grab CMDR data to see if they exist
let getCMDR = async cmdr => {
  let cmdrData = null;
  try {
    const response = await fetch(url + '/cmdrs?cmdrName=' + encodeURIComponent(cmdr), {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    });

    cmdrData = await response.json();
    return cmdrData;
  } catch (error) {
    console.log(error);
  }
};

// Create a CMDR who doesn't exist
let createCMDR = async cmdr => {
  let cmdrData = {
    cmdrName: cmdr,
  };

  try {
    await login();

    const response = await fetch(url + '/systems', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${jwt}`,
      },
      body: cmdrData,
    });

    let newCMDR = await response.json();
    return newCMDR;
  } catch (error) {
    console.log(error);
  }
};

// Fetch System from CAPIv2
let getSystem = async system => {
  try {
    const response = await fetch(url + '/systems?systemName=' + encodeURIComponent(system), {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    });

    let systemData = await response.json();
    return systemData;
  } catch (error) {
    console.log(error);
  }
};

// Create System in CAPIv2 and if applicable use EDSM data
let createSystem = async (system, data) => {
  let systemData = {
    systemName: system.toUpperCase(),
  };

  if (data) {
    if (data.id) {
      systemData.edsmID = data.id;
    }
    if (data.id64) {
      systemData.id64 = data.id64;
    }
    if (data.coords) {
      systemData.edsmCoordX = data.coords.x;
      systemData.edsmCoordY = data.coords.y;
      systemData.edsmCoordZ = data.coords.z;
    }
    if (data.coordsLocked) {
      systemData.edsmCoordLocked = data.coordsLocked;
    }
    if (data.primaryStar) {
      systemData.primaryStar = data.primaryStar;
    }
  } else {
    systemData.missingSkipCount = 1;
  }

  try {
    await login();

    const response = await fetch(url + '/systems', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${jwt}`,
      },
      body: systemData,
    });

    let newSystem = await response.json();
    return newSystem;
  } catch (error) {
    console.log(error);
  }
};

let getBody = async body => {
  try {
    const response = await fetch(url + `/bodies?bodyName=${body}`, {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    });

    let bodyData = await response.json();
    return bodyData;
  } catch (error) {
    console.log(error);
  }
};

// Create Body in CAPIv2 and if applicable use EDSM data
let createBody = async (system, body, data) => {
  let bodyData = {
    bodyName: body.toUpperCase(),
    system: system.id,
  };

  if (data) {
    if (data.id) {
      bodyData.edsmID = data.id;
    }
    if (data.id64) {
      bodyData.id64 = data.id64;
    }
    if (data.bodyId) {
      bodyData.bodyID = data.bodyId;
    }
    if (data.type) {
      bodyData.type = data.type;
    }
    if (data.subType) {
      bodyData.subType = data.subType;
    }
    if (data.distanceToArrival) {
      bodyData.distanceToArrival = data.distanceToArrival;
    }
    if (data.isMainStar) {
      bodyData.isMainStar = data.isMainStar;
    }
    if (data.isScoopable) {
      bodyData.isScoopable = data.isScoopable;
    }
    if (data.isLandable) {
      bodyData.isLandable = data.isLandable;
    }
    if (data.age) {
      bodyData.age = data.age;
    }
    if (data.luminosity) {
      bodyData.luminosity = data.luminosity;
    }
    if (data.absoluteMagnitude) {
      bodyData.absoluteMagnitude = data.absoluteMagnitude;
    }
    if (data.solarMasses) {
      bodyData.solarMasses = data.solarMasses;
    }
    if (data.solarRadius) {
      bodyData.solarRadius = data.solarRadius;
    }
    if (data.gravity) {
      bodyData.gravity = data.gravity;
    }
    if (data.earthMasses) {
      bodyData.earthMasses = data.earthMasses;
    }
    if (data.radius) {
      bodyData.radius = data.radius;
    }
    if (data.surfaceTemperature) {
      bodyData.surfaceTemperature = data.surfaceTemperature;
    }
    if (data.surfacePressure) {
      bodyData.surfacePressure = data.surfacePressure;
    }
    if (data.volcanismType) {
      bodyData.volcanismType = data.volcanismType;
    }
    if (data.atmosphereType) {
      bodyData.atmosphereType = data.atmosphereType;
    }
    if (data.terraformingState) {
      bodyData.terraformingState = data.terraformingState;
    }
    if (data.orbitalPeriod) {
      bodyData.orbitalPeriod = data.orbitalPeriod;
    }
    if (data.semiMajorAxis) {
      bodyData.semiMajorAxis = data.semiMajorAxis;
    }
    if (data.orbitalEccentricity) {
      bodyData.orbitalEccentricity = data.orbitalEccentricity;
    }
    if (data.orbitalInclination) {
      bodyData.orbitalInclination = data.orbitalInclination;
    }
    if (data.argOfPeriapsis) {
      bodyData.argOfPeriapsis = data.argOfPeriapsis;
    }
    if (data.rotationalPeriod) {
      bodyData.rotationalPeriod = data.rotationalPeriod;
    }
    if (data.rotationalPeriodTidallyLocked) {
      bodyData.rotationalPeriodTidallyLocked = data.rotationalPeriodTidallyLocked;
    }
    if (data.axialTilt) {
      bodyData.axialTilt = data.axialTilt;
    }
    if (data.solidComposition) {
      bodyData.solidComposition = data.solidComposition;
    }
    if (data.atmosphere) {
      bodyData.atmosphere = data.atmosphereComposition;
    }
    if (data.material) {
      bodyData.material = data.materials;
    }
    bodyData.missingSkipCount = 0;
  } else {
    bodyData.missingSkipCount = 1;
  }

  try {
    await login();

    const response = await fetch(url + '/systems', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${jwt}`,
      },
      body: bodyData,
    });

    let newBody = await response.json();
    return newBody;
  } catch (error) {
    console.log(error);
  }
};

// Get type to validate against
let getType = async (reportType, type) => {
  try {
    const response = await fetch(url + `/${reportType}types?type=` + encodeURIComponent(type), {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    });

    let typeData = await response.json();
    return typeData;
  } catch (error) {
    console.log(error);
  }
};

// Get a list of reports to check
let getReports = async reportType => {
  let reports = [];
  let keepGoing = true;
  let API_START = 0;
  let API_LIMIT = 1000;

  let reportData = null;
  while (keepGoing) {
    try {
      const response = await fetch(url + `/${reportType}reports?reportStatus=pending`, {
        method: 'GET',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
      });

      reportData = await response.json();
      reports.push.apply(reports, reportData);
      API_START += API_LIMIT;

      if (reportData.length < API_LIMIT) {
        keepGoing = false;
        return reports;
      }
    } catch (error) {
      console.log(error);
    }
  }
};

// Get sites to check for duplicates and look for data to update
let getSites = async (reportType, body) => {
  let sites = [];
  let keepGoing = true;
  let API_START = 0;
  let API_LIMIT = 1000;

  let siteData = null;
  while (keepGoing) {
    try {
      const response = await fetch(url + `/${reportType}sites?body.bodyName=` + encodeURIComponent(body), {
        method: 'GET',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
      });

      siteData = await response.json();
      sites.push.apply(sites, siteData);
      API_START += API_LIMIT;

      if (siteData.length < API_LIMIT) {
        keepGoing = false;
        return sites;
      }
    } catch (error) {
      console.log(error);
    }
  }
};

// Validate reports to ensure they have all the needed data
let validateReport = async (reportType, report) => {
  // Define all checks as failing until proven otherwise
  let reportChecks = {
    reportType: reportType + 'reports',
    reportID: report.id,
    valid: {
      isValid: false,
      reason: null,
      reportStatus: null,
    },
    isBeta: false,
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
        checked: false,
        exists: false,
        data: null,
      },
      body: {
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
        checked: false,
        exists: false,
        data: null,
      },
      duplicate: {
        createSite: false,
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
        systemExists: false,
        systemData: null,
      },
      body: {
        checked: false,
        bodyExists: false,
        bodyData: null,
      },
    },
  };

  // make sure the report isn't from beta
  if (report.isBeta === true) {
    reportChecks.isBeta = true;
    return reportChecks;
  }

  // check cmdr blacklist
  let checkCMDR = await checkCMDRBlacklist(report.cmdrName);

  if (!Array.isArray(checkCMDR) || !checkCMDR.length) {
    reportChecks.blacklists.cmdr.checked = true;
    reportChecks.blacklists.cmdr.blacklisted = false;
  } else {
    for (let i = 0; i < checkCMDR.length; i++) {
      if (report.cmdrName == checkCMDR[i].cmdrName) {
        reportChecks.blacklists.cmdr.checked = true;
        reportChecks.blacklists.cmdr.blacklisted = true;
        return reportChecks;
      }
    }
  }

  // check client blacklist
  let checkClient = await checkClientBlacklist(report.clientVersion);

  if (!Array.isArray(checkClient) || !checkClient.length) {
    reportChecks.blacklists.client.checked = true;
    reportChecks.blacklists.client.blacklisted = false;
  } else {
    for (let i = 0; i < checkClient.length; i++) {
      if (report.clientVersion == checkClient[i].clientVersion) {
        reportChecks.blacklists.client.checked = true;
        reportChecks.blacklists.client.blacklisted = true;
        return reportChecks;
      }
    }
  }

  // check capiv2 for system
  let checkCAPISystem = await getSystem(report.systemName);

  if (!Array.isArray(checkCAPISystem) || !checkCAPISystem.length) {
    reportChecks.capiv2.system.checked = true;
    reportChecks.capiv2.system.exists = false;
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
  let checkCAPIBody = await getBody(report.bodyName);

  if (!Array.isArray(checkCAPIBody) || !checkCAPIBody.length) {
    reportChecks.capiv2.body.checked = true;
    reportChecks.capiv2.body.exists = false;
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
  let checkCAPIType = await getType(reportType, report.type);

  if (!Array.isArray(checkCAPIType) || !checkCAPIType.length) {
    reportChecks.capiv2.type.checked = true;
    reportChecks.capiv2.type.exists = false;
    return reportChecks;
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
  let checkCAPICMDR = await getCMDR(report.cmdrName);

  if (!Array.isArray(checkCAPICMDR) || !checkCAPICMDR.length) {
    reportChecks.capiv2.cmdr.checked = true;
    reportChecks.capiv2.cmdr.exists = false;
  } else {
    for (let i = 0; i < checkCAPICMDR.length; i++) {
      if (report.cmdrName == checkCAPICMDR[i].cmdrName) {
        reportChecks.capiv2.cmdr.checked = true;
        reportChecks.capiv2.cmdr.exists = true;
        reportChecks.capiv2.cmdr.data = checkCAPICMDR[i];
      }
    }
  }

  // check edsm for system
  //let checkEDSMSystem = await getSystemEDSM(report.systemName);

  // check edsm for body
  //let checkEDSMBody = await getBodyEDSM(report.systemName);

  // check capiv2 for duplicate
  let checkCAPISite = await getSites(reportType, report.bodyName);

  if (!Array.isArray(checkCAPISite) || !checkCAPISite.length) {
    reportChecks.capiv2.duplicate.createSite = true;
    reportChecks.capiv2.duplicate.checkedHaversine = false;
    reportChecks.capiv2.duplicate.isDuplicate = false;
  } else {
    for (let i = 0; i < checkCAPISite.length; i++) {
      if (!report.latitude || !report.longitude || (report.latitude == 0 && report.longitude == 0)) {
        reportChecks.capiv2.duplicate.checkedHaversine = false;
        reportChecks.capiv2.duplicate.isDuplicate = false;
        return reportChecks;
      } else if (
        (report.systemName.toUpperCase() === checkCAPISite[i].system.systemName.toUpperCase() &&
          report.bodyName.toUpperCase() === checkCAPISite[i].body.bodyName.toUpperCase() &&
          report.latitude &&
          report.longitude &&
          checkCAPISite[i].body.radius) ||
        reportChecks.edsm.body.data.radius
        // Pending Frontier Update
        //report.frontierID === checkCAPISite[i].frontierID
      ) {
        let tempRadius = null;
        if (checkCAPISite[i].body.radius) {
          tempRadius = checkCAPISite[i].body.radius;
        } else if (reportChecks.edsm.body.data.radius) {
          tempRadius = reportChecks.edsm.body.data.radius;
        } else {
          reportChecks.capiv2.duplicate.checkedHaversine = false;
          reportChecks.capiv2.duplicate.isDuplicate = true;
          return reportChecks;
        }

        // Haversine Check
        if (tempRadius !== null) {
          let distance = await haversine(
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
          } else {
            reportChecks.capiv2.duplicate.checkedHaversine = true;
            reportChecks.capiv2.duplicate.isDuplicate = true;
            reportChecks.capiv2.duplicate.distance = distance;
            reportChecks.capiv2.duplicate.site = checkCAPISite[i];
            return reportChecks;
          }
        }
      }
    }
  }
  return reportChecks;
};

// Create site if report is valid
let createSite = async (reportType, data) => {
  //TODO Plan out what data is sent to this function..
  let siteData = {
    system: data.systemID,
    body: data.bodyID,
    siteID: data.siteID,
    latitude: data.latitude,
    longitude: data.longitude,
    type: data.typeID,
    frontierID: data.frontierID,
    verified: false,
    visible: true,
    discoveredBy: data.cmdrID,
  };

  try {
    await login();

    const response = await fetch(url + `/${reportType}sites`, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${jwt}`,
      },
      body: siteData,
    });

    let newSite = await response.json();
    console.log(newSite);
    return newSite;
  } catch (error) {
    console.log(error);
  }
};

// Update site if new data exists in a report
let updateSite = async data => {};

// Update report if it passes or fails validation
let updateReport = async reportID => {};

// Update log with changes made
let updateLog = {};
let updateAPILog = async data => {};

// Core function that calls all others for validation
let processReports = async () => {
  for (let i = 0; i < reportTypes.length; i++) {
    let count = await getCount(reportTypes[i]);
    if (count > 0) {
      console.log(`Running Validation on ${reportTypes[i]}`);
      updateLog[`${reportTypes[i]}reports`] = { count: count };

      let reportsToProcess = await getReports(reportTypes[i]);

      for (let r = 0; r < reportsToProcess.length; r++) {
        let reportChecked = await validateReport(reportTypes[i], reportsToProcess[r]);

        // Validate report based on prevbious updates to reportChecks
        if (reportChecked.isBeta === true) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'Report was from a Beta version';
          reportChecked.valid.reportStatus = reportStatus.beta;
        }
        if (reportChecked.blacklists.cmdr.blacklisted === true) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'CMDR is blacklisted';
          reportChecked.valid.reportStatus = reportStatus.blacklisted;
        }
        if (reportChecked.blacklists.client.blacklisted === true) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'Client is blacklisted';
          reportChecked.valid.reportStatus = reportStatus.blacklisted;
        }
        if (reportChecked.capiv2.system.checked === false) {
          //
        }
        if (reportChecked.capiv2.body.checked === false) {
          //
        }

        if (reportChecked.valid === false) {
          // Update report

          console.log(reportChecked);
          // if (reportChecked.capiv2.duplicate.isDuplicate == true) {
          //   console.log(reportChecked.capiv2.duplicate.site);
          // }
          // Update Log
        } else {
          // create system and Update Log
          // create body, assign system, and Update Log
          // create cmdr and Update Log
          // create/update site, assign system, body, type, and cmdr; Update Log
          // Update report
          // Update log
        }

        await delay(5000);
      }
    } else {
      updateLog[`${reportTypes[i]}reports`] = { reportCount: count };
    }
  }
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
