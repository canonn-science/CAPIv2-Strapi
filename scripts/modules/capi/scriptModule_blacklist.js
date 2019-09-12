const fetchTools = require('../scriptModule_fetchRetry');

// Check blacklists for CMDR or Client Version
const checkBlacklist = async (url, blacklistType, query) => {
  var blacklistURL;
  if (blacklistType === 'client') {
    blacklistURL = url + '/excludecmdrs?cmdrName=' + encodeURIComponent(query);
  } else if (blacklistType === 'cmdr') {
    blacklistURL = url + '/excludeclients?version=' + encodeURIComponent(query);
  }

  let response = await fetchTools.fetch_retry(5, blacklistURL, {
    method: 'GET',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  });

  let blacklistData = await response.json();
  return blacklistData;
};

module.exports = { checkBlacklist };
