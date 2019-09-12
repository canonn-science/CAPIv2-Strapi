// Fetch EDSM Body
const fetchTools = require('../scriptModule_fetchRetry');

// Fetch EDSM System
const getSystemEDSM = async (system) => {
  let edsmSystemURL = `https://www.edsm.net/en/api-v1/system?showId=1&showCoordinates=1&showPrimaryStar=1&systemName=${encodeURIComponent(system)}`;

  let edsmResponse = await fetchTools.fetch_retry( 5, edsmSystemURL,
    {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    }
  );

  let edsmSystemData = null;
  try {
    edsmSystemData = await edsmResponse.json();
  } catch (error) {
    edsmSystemData = {};
    console.log(error);
  }
  return edsmSystemData;
};

// Fetch EDSM Body
const getBodyEDSM = async (system) => {
  let edsmBodyURL = `https://www.edsm.net/en/api-system-v1/bodies?systemName=${encodeURIComponent(system)}`;

  let edsmResponse = await fetchTools.fetch_retry( 5, edsmBodyURL,
    {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    }
  );

  let edsmBodyData = null;
  try {
    edsmBodyData = await edsmResponse.json();
  } catch (error) {
    edsmBodyData = {};
    console.log(error);
  }
  return edsmBodyData;
};

module.exports = { getSystemEDSM, getBodyEDSM };
