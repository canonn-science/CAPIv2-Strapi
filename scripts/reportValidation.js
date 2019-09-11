const fetch = require('node-fetch');
const moment = require('moment');
const cron = require('node-cron');
require('dotenv').config({ path: require('find-config')('.env') });

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
    'identifier': process.env.SCRIPT_USER,
    'password': process.env.SCRIPT_PASS
  };

  // try logging in or log the error
  try {
    const response = await fetch(url + '/auth/local', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(body)
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
let reportTypes = [
  'ap', 'bm', 'bt', 'cs', 'fg', 'fm', 'gv', 'gy', 'ls', 'tb', 'tw'
];

// List of possible status options for report
let reportStatus = [
  'pending', 'accepted', 'duplicate', 'declined', 'issue'
];

// Fetch EDSM to verify it exists and sync data to CAPIv2
let getSystemEDSM = async (system) => {
  try {
    const response = await fetch(edsmSystemURL + encodeURIComponent(system), {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    let edsmSystem = await response.text();
    return edsmSystem;

  } catch (error) {
    console.log(error);
  }
};

// Fetch EDSM to verify it exists and sync data to CAPIv2
let getBodyEDSM = async (system) => {
  try {
    const response = await fetch(edsmBodyURL + encodeURIComponent(system), {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    let edsmBody = await response.text();
    return edsmBody;

  } catch (error) {
    console.log(error);
  }
};

// Get count of reports to see if we need to validate them
let getCount = async (reportType) => {
  try {
    const response = await fetch(url + `/${reportType}reports/count?reportStatus=pending`, {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    let count = await response.text();
    return count;

  } catch (error) {
    console.log(error);
  }
};

// Check blacklists for CMDR Name
let checkCMDRBlacklist = async (cmdr) => {
  try {
    const response = await fetch(url + '/excludecmdrs?cmdrName=' + encodeURIComponent(cmdr), {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    let cmdrBlacklistData = await response.json();
    console.log(cmdrBlacklistData);
    return cmdrBlacklistData;

  } catch (error) {
    console.log(error);
  }
};

// Check blacklists for Client Version
let checkClientBlacklist = async (clientVersion) => {
  try {
    const response = await fetch(url + '/excludeclients?version=' + encodeURIComponent(clientVersion), {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    let clientBlacklistData = await response.json();
    console.log(clientBlacklistData);
    return clientBlacklistData;

  } catch (error) {
    console.log(error);
  }
};

// Grab CMDR data to see if they exist
let getCMDR = async (cmdr) => {
  let cmdrData = null;
  try {
    const response = await fetch(url + '/cmdrs?cmdrName=' + encodeURIComponent(cmdr), {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    cmdrData = await response.json();
    console.log(cmdrData);
    return cmdrData;

  } catch (error) {
    console.log(error);
  }
};

// Create a CMDR who doesn't exist
let createCMDR = async (cmdr) => {
  let cmdrData = {
    cmdrName: cmdr
  };

  try {
    await login();

    const response = await fetch(url + '/systems', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${jwt}`
      },
      body: cmdrData
    });

    let newCMDR = await response.json();
    console.log(newCMDR);
    return newCMDR;

  } catch (error) {
    console.log(error);
  }

};

// Fetch System from CAPIv2
let getSystem = async (system) => {
  try {
    const response = await fetch(url + '/systems?systemName=' + encodeURIComponent(system), {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    let systemData = await response.json();
    console.log(systemData);
    return systemData;

  } catch (error) {
    console.log(error);
  }
};

// Create System in CAPIv2 and if applicable use EDSM data
let createSystem = async (system, data) => {
  let systemData = {
    systemName: system.toUpperCase()
  };

  if (data) {
    if (data.id) { systemData.edsmID = data.id; }
    if (data.id64) { systemData.id64 = data.id64; }
    if (data.coords) {
      systemData.edsmCoordX = data.coords.x;
      systemData.edsmCoordY = data.coords.y;
      systemData.edsmCoordZ = data.coords.z;
    }
    if (data.coordsLocked) { systemData.edsmCoordLocked = data.coordsLocked; }
    if (data.primaryStar) { systemData.primaryStar = data.primaryStar; }
  } else {
    systemData.missingSkipCount = 1;
  }

  try {
    await login();

    const response = await fetch(url + '/systems', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${jwt}`
      },
      body: systemData
    });

    let newSystem = await response.json();
    console.log(newSystem);
    return newSystem;

  } catch (error) {
    console.log(error);
  }
};

let getBody = async (body) => {
  try {
    const response = await fetch(url + `/bodies?bodyName=${body}`, {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    let bodyData = await response.json();
    console.log(bodyData);
    return bodyData;

  } catch (error) {
    console.log(error);
  }

};

// Create Body in CAPIv2 and if applicable use EDSM data
let createBody = async (system, body, data) => {
  let bodyData = {
    bodyName: body.toUpperCase(),
    system: system.id
  };

  if (data) {
    if (data.id) { bodyData.edsmID = data.id; }
    if (data.id64) { bodyData.id64 = data.id64; }
    if (data.bodyId) { bodyData.bodyID = data.bodyId; }
    if (data.type) { bodyData.type = data.type; }
    if (data.subType) { bodyData.subType = data.subType; }
    if (data.distanceToArrival) { bodyData.distanceToArrival = data.distanceToArrival; }
    if (data.isMainStar) { bodyData.isMainStar = data.isMainStar; }
    if (data.isScoopable) { bodyData.isScoopable = data.isScoopable; }
    if (data.isLandable) { bodyData.isLandable = data.isLandable; }
    if (data.age) { bodyData.age = data.age; }
    if (data.luminosity) { bodyData.luminosity = data.luminosity; }
    if (data.absoluteMagnitude) { bodyData.absoluteMagnitude = data.absoluteMagnitude; }
    if (data.solarMasses) { bodyData.solarMasses = data.solarMasses; }
    if (data.solarRadius) { bodyData.solarRadius = data.solarRadius; }
    if (data.gravity) { bodyData.gravity = data.gravity; }
    if (data.earthMasses) { bodyData.earthMasses = data.earthMasses; }
    if (data.radius) { bodyData.radius = data.radius; }
    if (data.surfaceTemperature) { bodyData.surfaceTemperature = data.surfaceTemperature; }
    if (data.surfacePressure) { bodyData.surfacePressure = data.surfacePressure; }
    if (data.volcanismType) { bodyData.volcanismType = data.volcanismType; }
    if (data.atmosphereType) { bodyData.atmosphereType = data.atmosphereType; }
    if (data.terraformingState) { bodyData.terraformingState = data.terraformingState; }
    if (data.orbitalPeriod) { bodyData.orbitalPeriod = data.orbitalPeriod; }
    if (data.semiMajorAxis) { bodyData.semiMajorAxis = data.semiMajorAxis; }
    if (data.orbitalEccentricity) { bodyData.orbitalEccentricity = data.orbitalEccentricity; }
    if (data.orbitalInclination) { bodyData.orbitalInclination = data.orbitalInclination; }
    if (data.argOfPeriapsis) { bodyData.argOfPeriapsis = data.argOfPeriapsis; }
    if (data.rotationalPeriod) { bodyData.rotationalPeriod = data.rotationalPeriod; }
    if (data.rotationalPeriodTidallyLocked) { bodyData.rotationalPeriodTidallyLocked = data.rotationalPeriodTidallyLocked; }
    if (data.axialTilt) { bodyData.axialTilt = data.axialTilt; }
    if (data.solidComposition) { bodyData.solidComposition = data.solidComposition; }
    if (data.atmosphere) { bodyData.atmosphere = data.atmosphereComposition; }
    if (data.material) { bodyData.material = data.materials; }
    bodyData.missingSkipCount = 0;
  } else {
    bodyData.missingSkipCount = 1;
  }

  try {
    await login();

    const response = await fetch(url + '/systems', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${jwt}`
      },
      body: bodyData
    });

    let newBody = await response.json();
    console.log(newBody);
    return newBody;

  } catch (error) {
    console.log(error);
  }
};

// Get types to validate against
let getTypes = async (reportType, type) => {
  try {
    const response = await fetch(url + `/${reportType}types?type=` + encodeURIComponent(type), {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    let typeData = await response.json();
    console.log(typeData);
    return typeData;

  } catch (error) {
    console.log(error);
  }
};

// Get a list of reports to check
let getReports = async (reportType) => {
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
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      });

      reportData = await response.json();
      reports.push.apply(reports, reportData);
      API_START += API_LIMIT;

      if (reportData.length < API_LIMIT) {
        keepGoing = false;

        console.log(reports);
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
      const response = await fetch(url + `/${reportType}sites?bodyName=` + encodeURIComponent(body), {
        method: 'GET',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      });

      siteData = await response.json();
      sites.push.apply(sites, siteData);
      API_START += API_LIMIT;

      if (siteData.length < API_LIMIT) {
        keepGoing = false;

        console.log(sites);
        return sites;
      }
    } catch (error) {
      console.log(error);
    }
  }
};

// Validate reports to ensure they have all the needed data
let validateReport = async (report) => {

  // Define all checks as failing until proven otherwise
  let validReportData = {
    valid: false,
    blacklists: {
      cmdrBlacklisted: true,
      clientBlacklisted: true
    },
    capiv2: {
      systemExists: false,
      bodyExists: false,
      cmdrExists: false,
      duplicate: true
    },
    edsm: {
      systemData: false,
      bodyData: false
    }
  };

  // check blacklists

  // check capiv2

  // check edsm

  // return checks and data

  return validReportData;
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
    discoveredBy: data.cmdrID
  };

  try {
    await login();

    const response = await fetch(url + `/${reportType}sites`, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${jwt}`
      },
      body: siteData
    });

    let newSite = await response.json();
    console.log(newSite);
    return newSite;

  } catch (error) {
    console.log(error);
  }
};

// Update site if new data exists in a report
let updateSite = async (data) => {

};

// Update report if it passes or fails validation
let updateReport = async (reportID) => {

};

// Update log with changes made
let updateLog = {};
let updateAPILog = async (data) => {

};

// Core function that calls all others for validation
let processReports = async () => {
  for (let i = 0; i < reportTypes.length; i++) {
    let count = await getCount(reportTypes[i]);
    if (count > 0) {

      console.log(`Running Validation on ${reportTypes[i]}`);
      updateLog[`${reportTypes[i]}reports`] = { count: count };

      let reportsToProcess = await getReports(reportTypes[i]);

      for (let i = 0; i < reportsToProcess.length; i++) {
        let reportChecked = await validateReport(reportsToProcess[i]);

        if (reportChecked === false) {
          // Update Log
        } else {
          // create system

          // create body and assign system

          // create cmdr

          // create/update site and assign system, body, cmdr

          // update report

          // Update log
        }
      }
    } else {
      updateLog[`${reportTypes[i]}reports`] = { count: count };
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
