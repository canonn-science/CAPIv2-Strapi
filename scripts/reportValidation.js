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

// Set report types that will be verified and converted to sites
let reportTypes = ['ap', 'bm', 'bt', 'cs', 'fg', 'fm', 'gv', 'gy', 'ls', 'tb', 'tw'];

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

const fetch_retry = async (url, options, n) => {
  try {
    return await fetch(url, options);
  } catch (error) {
    if (n === 1) console.log(error);
    delay(5000);
    return await fetch_retry(url, options, n - 1);
  }
};

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

// Fetch EDSM to verify it exists and sync data to CAPIv2
let getSystemEDSM = async system => {
  let edsmResponse = await fetch_retry(
    edsmSystemURL + encodeURIComponent(system),
    {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    },
    5
  );

  let edsmData = null;
  try {
    edsmData = await edsmResponse.json();
  } catch (error) {
    edsmData = {};
    console.log(error);
  }

  return edsmData;
};

// Fetch EDSM to verify it exists and sync data to CAPIv2
let getBodyEDSM = async system => {
  let edsmResponse = await fetch_retry(
    edsmBodyURL + encodeURIComponent(system),
    {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    },
    5
  );

  let edsmData = null;
  try {
    edsmData = await edsmResponse.json();
  } catch (error) {
    edsmData = {};
    console.log(error);
  }

  return edsmData;
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
    const response = await fetch(url + '/systems', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${jwt}`,
      },
      body: JSON.stringify(cmdrData),
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
let createSystem = async data => {
  console.log('SYSTEM');
  console.log(data);
  try {
    const response = await fetch(url + '/systems', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${jwt}`,
      },
      body: JSON.stringify(data),
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
let createBody = async (systemID, body, data) => {
  let bodyData = {
    bodyName: body.toUpperCase(),
    system: systemID,
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

  console.log('BODY');
  console.log(bodyData);
  try {
    const response = await fetch(url + '/systems', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${jwt}`,
      },
      body: JSON.stringify(bodyData),
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
let getSites = async (reportType, bodyID, body) => {
  let sites = [];
  let keepGoing = true;
  let API_START = 0;
  let API_LIMIT = 1000;
  let params = null;

  if (bodyID) {
    params = `/${reportType}sites?body=` + encodeURIComponent(bodyID.id);
  } else {
    params = `/${reportType}sites?body.bodyName=` + encodeURIComponent(body);
  }

  let siteData = null;
  while (keepGoing) {
    try {
      const response = await fetch(url + params, {
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
  let checkEDSMSystem = await getSystemEDSM(report.systemName);

  if (Object.keys(checkEDSMSystem).length < 1) {
    reportChecks.edsm.system.checked = true;
    reportChecks.edsm.system.exists = false;
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
  let checkEDSMBody = await getBodyEDSM(report.systemName);

  if (!Array.isArray(checkEDSMBody.bodies) || !checkEDSMBody.bodies.length) {
    reportChecks.edsm.body.checked = true;
    reportChecks.edsm.body.exists = false;
  } else {
    for (let i = 0; i < checkEDSMBody.bodies.length; i++) {
      if (report.bodyName.toUpperCase() == checkEDSMBody.bodies[i].name.toUpperCase()) {
        reportChecks.edsm.body.checked = true;
        reportChecks.edsm.body.exists = true;
        reportChecks.edsm.body.data = checkEDSMBody.bodies[i];
      }
    }
  }

  // check capiv2 for duplicate
  let checkCAPISite = await getSites(reportType, reportChecks.capiv2.body.data, report.bodyName);

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
        report.systemName.toUpperCase() === checkCAPISite[i].system.systemName.toUpperCase() &&
        report.bodyName.toUpperCase() === checkCAPISite[i].body.bodyName.toUpperCase() &&
        report.latitude &&
        report.longitude &&
        (checkCAPISite[i].body.radius || reportChecks.edsm.body.data.radius)
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

// Used to fetch the highest siteID to create a new site
let getSiteID = async reportType => {
  try {
    const response = await fetch(url + `/${reportType}sites?_limit=1&_sort=siteID:desc`, {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    });

    let site = await response.json();

    if (!Array.isArray(site) || !site.length) {
      return 1;
    } else {
      let newSiteID = site[0].siteID + 1;
      return newSiteID;
    }
  } catch (error) {
    console.log(error);
  }
};

// Create site if report is valid
let createSite = async (reportType, data) => {
  let newSiteID = await getSiteID(reportType);
  let siteData = {
    system: data.system,
    body: data.body,
    siteID: newSiteID,
    latitude: data.latitude,
    longitude: data.longitude,
    type: data.type,
    frontierID: data.frontierID,
    verified: false,
    visible: true,
    discoveredBy: data.discoveredBy,
  };

  try {
    const response = await fetch(url + `/${reportType}sites`, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${jwt}`,
      },
      body: JSON.stringify(siteData),
    });

    let newSite = await response.json();
    console.log(newSite);
    return newSite;
  } catch (error) {
    console.log(error);
  }
};

// Update site if new data exists in a report
let updateSite = async data => {
  let updatedSiteData = {};
};

// Update report if it passes or fails validation
let updateReport = async (reportType, reportID, data) => {
  try {
    const response = await fetch(url + `/${reportType}reports/${reportID}`, {
      method: 'PUT',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${jwt}`,
      },
      body: JSON.stringify(data),
    });

    let newReport = await response.json();
    return newReport;
  } catch (error) {
    console.log(error);
  }
};

// Update log with changes made
let updateLog = {};
let updateAPILog = async data => {};

// Core function that calls all others for validation
let processReports = async () => {
  console.log(
    moment()
      .utc()
      .format() + ' - Logging into CAPIv2'
  );
  await login();
  if (!jwt){
    console.log('LOGIN FAILED');
  } else {
    console.log('Successfully Logged in!');
  }
  // Start processing
  console.log(
    moment()
      .utc()
      .format() + ' - Starting to process reports'
  );

  // Get counts to check if we need to process reports for that site type
  for (let i = 0; i < reportTypes.length; i++) {
    let count = await getCount(reportTypes[i]);

    // If count is more than zero, fetch reports and start processing them
    if (count > 0) {
      // Start report processing
      console.log(
        moment()
          .utc()
          .format() + ` - Running Validation on ${reportTypes[i]}reports`
      );
      updateLog[`${reportTypes[i]}reports`] = { reportCount: count };

      let reportsToProcess = await getReports(reportTypes[i]);

      // Loop through reports and process one by one
      for (let r = 0; r < reportsToProcess.length; r++) {
        console.log(
          moment()
            .utc()
            .format() + ` - Processing ${reportTypes[i]}report ID: ${reportsToProcess[r].id}`
        );

        // Validate the report with multiple checks
        let reportChecked = await validateReport(reportTypes[i], reportsToProcess[r]);

        // Validate report based on previous updates to reportChecks
        // isBeta
        if (reportChecked.isBeta === true) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'Report was from a Beta version';
          reportChecked.valid.reportStatus = reportStatus.beta;
        }

        // blacklists
        if (reportChecked.blacklists.cmdr.blacklisted === true) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'CMDR is blacklisted';
          reportChecked.valid.reportStatus = reportStatus.blacklisted;
        } else if (reportChecked.blacklists.cmdr.checked === false) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'Issue with checking blacklist';
          reportChecked.valid.reportStatus = reportStatus.network;
        } else if (reportChecked.blacklists.client.blacklisted === true) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'Client is blacklisted';
          reportChecked.valid.reportStatus = reportStatus.blacklisted;
        } else if (reportChecked.blacklists.cmdr.checked === false) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'Issue with checking blacklist';
          reportChecked.valid.reportStatus = reportStatus.network;
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
        } else if (reportChecked.capiv2.type.exists === false) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'Type does not match approved types';
          reportChecked.valid.reportStatus = reportStatus.capiv2Type;
        } else if (
          reportChecked.capiv2.duplicate.createSite === false &&
          reportChecked.capiv2.duplicate.checkedHaversine === false
        ) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'Unable to check duplicate based on haversine, missing radius or lat/lon';
          reportChecked.valid.reportStatus = reportStatus.network;
        } else if (reportChecked.capiv2.duplicate.isDuplicate === true) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = `Site is a duplicate of Site: ${
            reportChecked.capiv2.duplicate.site.id
          } at a distance of ${reportChecked.capiv2.duplicate.distance.toFixed(2)} Km`;
          reportChecked.valid.reportStatus = reportStatus.duplicate;
        }

        // EDSM
        if (reportChecked.edsm.system.checked === false || reportChecked.edsm.body.checked === false) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'Unable to check EDSM due to a network error';
          reportChecked.valid.reportStatus = reportStatus.network;
        } else if (reportChecked.edsm.system.exists === true && reportChecked.edsm.system.hasCoords === false) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'System exists in EDSM but has no Coords (Console user?)';
          reportChecked.valid.reportStatus = reportStatus.missingCoords;
        } else if (reportChecked.capiv2.system.exists === false && reportChecked.edsm.system.exists === false) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'System does not exist in CAPIv2 or EDSM';
          reportChecked.valid.reportStatus = reportStatus.edsmSystem;
        } else if (reportChecked.capiv2.body.exists === false && reportChecked.edsm.body.exists === false) {
          reportChecked.valid.isValid = false;
          reportChecked.valid.reason = 'Body does not exist in CAPIv2 or EDSM';
          reportChecked.valid.reportStatus = reportStatus.edsmBody;
        }

        // Set Valid if no reason or reportStatus
        if (reportChecked.valid.reason === null || reportChecked.valid.reportStatus === null) {
          reportChecked.valid.isValid = true;
          reportChecked.valid.reason = 'Report has been accepted';
          reportChecked.valid.reportStatus = reportStatus.accepted;
        }

        // Push reportLog into UpdateLog
        (updateLog[`${reportTypes[i]}reports`].reports = updateLog[`${reportTypes[i]}reports`].reports || []).push(
          reportChecked
        );

        if (reportChecked.valid.isValid === false) {
          // Update report
          let newReportComment = `[${reportChecked.valid.reportStatus.toUpperCase()}] - ${
            reportChecked.valid.reportComment
          }`;

          let dupSiteID = null;
          if (reportChecked.capiv2.duplicate.isDuplicate === true && reportChecked.capiv2.duplicate.site !== null) {
            dupSiteID = reportChecked.capiv2.duplicate.site.id;
          } else {
            dupSiteID = null;
          }

          let reportData = {
            reportStatus: reportChecked.valid.reportStatus,
            reportComment: newReportComment,
            added: false,
            site: dupSiteID,
          };

          await updateReport(reportTypes[i], reportChecked.reportID, reportData);
          console.log(
            moment()
              .utc()
              .format() + ` - Updated invalid ${reportTypes[i]}report ID: ${reportsToProcess[r].id}`
          );
        } else {
          // create system or use existing
          let newSystem = {};
          if (reportChecked.capiv2.system.exists === false && reportChecked.capiv2.system.checked === true) {
            let systemData = {};
            if (
              reportChecked.edsm.system.checked === true &&
              reportChecked.edsm.system.exists === true &&
              reportChecked.edsm.system.hasCoords === true
            ) {
              systemData = {
                systemName: reportChecked.edsm.system.data.name.toUpperCase(),
                id64: reportChecked.edsm.system.data.id64,
                edsmID: reportChecked.edsm.system.data.id,
                edsmCoordX: reportChecked.edsm.system.data.coords.x,
                edsmCoordY: reportChecked.edsm.system.data.coords.y,
                edsmCoordZ: reportChecked.edsm.system.data.coords.z,
                edsmCoordLocked: reportChecked.edsm.system.data.coordsLocked,
                primaryStar: reportChecked.edsm.system.data.primaryStar,
              };
            } else {
              systemData = {
                systemName: reportsToProcess[r].systemName.toUpperCase(),
              };
            }
            newSystem = await createSystem(systemData);
            // Push new system into log
            (updateLog.systems = updateLog.systems || []).push(newSystem);
          } else {
            newSystem = reportChecked.capiv2.system.data;
          }

          // create body, assign system, or use existing
          let newBody = {};
          if (reportChecked.capiv2.body.exists === false && reportChecked.capiv2.body.checked === true) {
            let bodyData = {};
            if (reportChecked.edsm.body.checked === true && reportChecked.edsm.body.exists === true) {
              bodyData = reportChecked.edsm.body.data;
              newBody = await createBody(newSystem.id, reportChecked.edsm.body.data.name, bodyData);
              // Push new system into log
              (updateLog.bodies = updateLog.bodies || []).push(newBody);
            }
          } else {
            newBody = reportChecked.capiv2.body.data;
          }

          // create cmdr or use existing
          let newCMDR = {};
          if (reportChecked.capiv2.cmdr.exists === false && reportChecked.capiv2.cmdr.checked === true) {
            newCMDR = await createCMDR(reportsToProcess[r].cmdrName);
          } else {
            newCMDR = reportChecked.capiv2.cmdr.data;
          }

          // create/update site, assign system, body, type, and cmdr
          let newSite = {};
          if (
            reportChecked.capiv2.duplicate.isDuplicate === false &&
            reportChecked.capiv2.duplicate.createSite === true
          ) {
            let siteData = {
              system: newSystem.id,
              body: newBody.id,
              latitude: reportsToProcess[r].latitude,
              longitude: reportsToProcess[r].longitude,
              type: reportChecked.capiv2.type.data.id,
              frontierID: reportsToProcess[r].frontierID,
              verified: false,
              visible: true,
              discoveredBy: newCMDR.id,
            };

            newSite = await createSite(reportTypes[i], siteData);
          }

          // Update report
          let newReportComment = `[${reportChecked.valid.reportStatus.toUpperCase()}] - ${
            reportChecked.valid.reportComment
          }`;

          let reportData = {
            reportStatus: reportChecked.valid.reportStatus,
            reportComment: newReportComment,
            added: true,
            site: newSite.id,
          };

          await updateReport(reportTypes[i], reportChecked.reportID, reportData);
          console.log(
            moment()
              .utc()
              .format() + ` - Updated invalid ${reportTypes[i]}report ID: ${reportsToProcess[r].id}`
          );
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
