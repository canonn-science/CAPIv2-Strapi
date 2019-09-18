const fetchTools = require('../scriptModule_fetchRetry');

// Get a single site by ID or fetch all sites matching a body
const getSites = async (url, reportType, body, siteID) => {
  let sites = [];
  let siteData = null;
  let keepGoing = true;
  let API_START = 0;
  let API_LIMIT = 1000;

  var sitesURL;
  if (siteID && (!body || body === null || typeof body === 'undefined')) {
    sitesURL = url + `/${reportType}sites/${siteID}`;
  } else {
    sitesURL =
      url + `/${reportType}sites?_limit=${API_LIMIT}&_start=${API_START}&body.bodyName=` + encodeURIComponent(body);
  }

  while (keepGoing) {
    let response = await fetchTools.fetch_retry(5, sitesURL, {
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
  }
};

// Used to fetch the highest siteID to create a new site
const getSiteID = async (url, reportType) => {
  let siteIDURL = url + `/${reportType}sites?_limit=1&_sort=siteID:desc`;
  const response = await fetchTools.fetch_retry(5, siteIDURL, {
    method: 'GET',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  });

  let siteIDData = await response.json();

  if (!Array.isArray(siteIDData) || !siteIDData.length) {
    return 1;
  } else {
    let newSiteID = siteIDData[0].siteID + 1;
    return newSiteID;
  }
};

// Create site if report is valid
const createSite = async (url, reportType, siteData, jwt) => {
  let newSiteID = await getSiteID(url, reportType);

  siteData.siteID = newSiteID;

  let createSiteURL = url + `/${reportType}sites`;
  let response = await fetchTools.fetch_retry(5, createSiteURL, {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      Authorization: `Bearer ${jwt}`,
    },
    body: JSON.stringify(siteData),
  });

  let newSite = await response.json();
  return newSite;
};

// Update site if new data exists in a report
const updateSite = async (url, reportType, siteID, siteData, jwt) => {
  let siteURL = url + `/${reportType}sites/${siteID}`;
  let response = await fetchTools.fetch_retry(5, siteURL, {
    method: 'PUT',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      Authorization: `Bearer ${jwt}`,
    },
    body: JSON.stringify(siteData),
  });

  let updatedSite = await response.json();
  return updatedSite;
};

module.exports = { getSites, createSite, updateSite};
