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
