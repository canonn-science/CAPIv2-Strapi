const fetchTools = require('../scriptModule_fetchRetry');

const updateAPILog = async (url, logdata, jwt) => {
  let logURL = url + '/apiupdates';

  let response = await fetchTools.fetch_retry(5, logURL, {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      Authorization: `Bearer ${jwt}`,
    },
    body: JSON.stringify(logdata),
  });
  let newLog = await response.json();

  return newLog;
};

module.exports = { updateAPILog };
