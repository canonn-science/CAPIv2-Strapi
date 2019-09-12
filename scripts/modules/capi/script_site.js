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
