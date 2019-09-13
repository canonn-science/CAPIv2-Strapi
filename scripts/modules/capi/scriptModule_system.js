const fetchTools = require('../scriptModule_fetchRetry');

// Fetch System from CAPIv2
const getSystem = async (url, system, systemID) => {
  var systemURL;
  if (systemID && (!system || system === null || typeof system === 'undefined')) {
    systemURL = url + `/systems/${systemID}`;
  } else {
    systemURL = url + '/systems?systemName=' + encodeURIComponent(system);
  }

  let response = await fetchTools.fetch_retry(5, systemURL, {
    method: 'GET',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  });

  let systemData = await response.json();
  return systemData;
};

// Create System in CAPIv2
const createSystem = async (url, systemData, jwt) => {
  let systemURL = url + '/systems';

  if (systemData.systemName === null || typeof systemData.systemName === 'undefined') {
    return {};
  } else {
    let response = await fetchTools.fetch_retry(5, systemURL, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${jwt}`,
      },
      body: JSON.stringify(systemData),
    });

    let newSystem = await response.json();
    return newSystem;
  }
};

// Create System in CAPIv2
const updateSystem = async (url, systemID, systemData, jwt) => {
  let systemURL = url + `/systems/${systemID}`;

  let response = await fetchTools.fetch_retry(5, systemURL, {
    method: 'PUT',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      Authorization: `Bearer ${jwt}`,
    },
    body: JSON.stringify(systemData),
  });

  let updatedSystem = await response.json();
  return updatedSystem;
};

module.exports = { getSystem, createSystem, updateSystem };
