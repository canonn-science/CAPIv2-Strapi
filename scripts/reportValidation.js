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
let edsmSystem = 'https://www.edsm.net/en/api-v1/system?showId=1&showCoordinates=1&showPrimaryStar=1&systemName=';
let edsmBody = 'https://www.edsm.net/en/api-system-v1/bodies?systemName=';

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

};

// Fetch EDSM to verify it exists and sync data to CAPIv2
let getBodyEDSM = async (system) => {

};

// Get count of reports to see if we need to validate them
let getCount = async (reportType) => {
  let count = null;
  try {
    const response = await fetch(url + `/${reportType}reports/count?reportStatus=pending`, {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    count = await response.text();

  } catch (error) {
    console.log(error);
  }
  return count;
};

// Fetch System from CAPIv2
let getSystem = async (system) => {
  let systemData = null;
  try {
    const response = await fetch(url + '/systems?systemName=' + encodeURIComponent(system), {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    systemData = await response.json();

  } catch (error) {
    console.log(error);
  }

  console.log(systemData);
  return systemData;
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

  let newSystem = null;
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

    newSystem = await response.json();
  } catch (error) {
    console.log(error);
  }

  console.log(newSystem);
  return newSystem;
};

let getBody = async (body) => {
  let bodyData = null;
  try {
    const response = await fetch(url + `/bodies?bodyName=${body}`, {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    bodyData = await response.json();

  } catch (error) {
    console.log(error);
  }

  console.log(bodyData);
  return bodyData;
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

  let newBody = null;
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

    newBody = await response.json();
  } catch (error) {
    console.log(error);
  }

  console.log(newBody);
  return newBody;
};

let getTypes = async (reportType, type) => {
  let typeData = null;
  try {
    const response = await fetch(url + `/${reportType}types?type=` + encodeURIComponent(type), {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });

    typeData = await response.json();

  } catch (error) {
    console.log(error);
  }

  console.log(typeData);
  return typeData;
};

let getReports = async (reportType) => {

};

let updateReport = async (reportID) => {

};

let getSites = async (body) => {

};

let createSite = async (data) => {

};

let updateSite = async (data) => {

};

let validateReports = async () => {
  for (let i = 0; i < reportTypes.length; i++) {
    let count = await getCount(reportTypes[i]);
    if (count > 0) {
      console.log(`Running Validation on ${reportTypes[i]}`);
      console.log('Count: ' + count);
    }
  }
};

// if (process.env.SCRIPT_RV === 'true') {
//   cron.schedule(process.env.SCRIPT_RV_CRON, () => {
//     validateReports();
//   });
// } else {
//   console.log('This script has been disabled');
//   process.exit(0);
// }

validateReports();
