const fetchTools = require('../scriptModule_fetchRetry');

// Get type to validate against
const getType = async (url, reportType, type) => {
  let typeURL = url + `/${reportType}types?type=` + encodeURIComponent(type);

  let response = await fetchTools.fetch_retry(5, typeURL, {
    method: 'GET',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  });

  return await response.json();
};

module.exports = { getType };
