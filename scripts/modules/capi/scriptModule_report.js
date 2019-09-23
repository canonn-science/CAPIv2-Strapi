const fetchTools = require('../scriptModule_fetchRetry');

// Get count of reports to see if we need to validate them
const getCount = async (url, reportType, reportStatus) => {
  let reportCountURL = url + `/${reportType}reports/count?reportStatus=${reportStatus}`;
  const response = await fetchTools.fetch_retry(5, reportCountURL, {
    method: 'GET',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  });

  return await response.text();
};

// Fetch all Reports based on type
const getReports = async (url, reportType, reportStatus) => {
  let reports = [];
  let reportData = null;
  let keepGoing = true;
  let API_START = 0;
  let API_LIMIT = 1000;

  while (keepGoing) {
    let reportURL = url + `/${reportType}reports?reportStatus=${reportStatus}&_limit=${API_LIMIT}&_start=${API_START}`;
    const response = await fetchTools.fetch_retry(5, reportURL, {
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
  }
};

// Update report based on type and ID
const updateReport = async (url, reportType, reportID, reportData, jwt) => {
  let reportURL = url + `/${reportType}reports/${reportID}`;
  let response = await fetchTools.fetch_retry(5, reportURL, {
    method: 'PUT',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      Authorization: `Bearer ${jwt}`,
    },
    body: JSON.stringify(reportData),
  });

  return await response.json();
};

module.exports = { getCount, getReports, updateReport };
