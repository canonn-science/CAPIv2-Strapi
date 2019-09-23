const fetchTools = require('../scriptModule_fetchRetry');

// Get type to validate against
const getRegion = async (url, journalName, regionID) => {
  var regionURL;
  if (!journalName) {
    regionURL = url + `/regions?regionID=${regionID}`;
  } else {
    regionURL = url + '/regions?journalName=' + encodeURIComponent(journalName);
  }

  let response = await fetchTools.fetch_retry(5, regionURL, {
    method: 'GET',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  });

  return await response.json();
};

module.exports = { getRegion };
