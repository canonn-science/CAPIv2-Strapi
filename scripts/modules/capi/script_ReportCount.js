import { fetch_retry } from '../script_fetchRetry';

// Get count of reports to see if we need to validate them
export const getCount = async (url, reportType, reportStatus) => {
  let reportCountURL = url + `/${reportType}reports/count?reportStatus=` + encodeURIComponent(reportStatus);
  const response = await fetch_retry(5, reportCountURL, {
    method: 'GET',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  });

  let count = await response.text();
  return count;
};
