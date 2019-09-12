import { fetch_retry } from '../script_fetchRetry';

// Get type to validate against
export const getType = async (url, reportType, type) => {
  let typeURL = url + `/${reportType}types?type=` + encodeURIComponent(type);

  let response = await fetch_retry(5, typeURL, {
    method: 'GET',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  });

  let typeData = await response.json();
  return typeData;
};
