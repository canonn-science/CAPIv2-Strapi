const fetchTools = require('../scriptModule_fetchRetry');

// Fetch System from CAPIv2
const getBody = async (url, body, bodyID) => {
  var bodyURL;
  if (bodyID && (!body || body === null || typeof body === 'undefined')) {
    bodyURL = url + `/bodies/${bodyID}`;
  } else {
    bodyURL = url + '/bodies?bodyName=' + encodeURIComponent(body);
  }

  let response = await fetchTools.fetch_retry(5, bodyURL, {
    method: 'GET',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  });

  let bodyData = await response.json();
  return bodyData;
};

// Create Body in CAPIv2
const createBody = async (url, bodyData, jwt) => {
  let bodyURL = url + '/bodies';

  if (bodyData.bodyName === null || typeof bodyData.bodyName === 'undefined') {
    return {};
  } else {
    let response = await fetchTools.fetch_retry(5, bodyURL, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${jwt}`,
      },
      body: JSON.stringify(bodyData),
    });

    let newBody = await response.json();
    return newBody;
  }
};

module.exports = { getBody, createBody };
