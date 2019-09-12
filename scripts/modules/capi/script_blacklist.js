import { fetch_retry } from '../script_fetchRetry';

// Check blacklists for CMDR or Client Version
export const checkBlacklist = async (url, blacklistType, query) => {
  var blacklistURL;
  if (blacklistType === 'client') {
    blacklistURL = url + '/excludecmdrs?cmdrName=' + encodeURIComponent(query);
  } else if (blacklistType === 'cmdr') {
    blacklistURL = url + '/excludeclients?version=' + encodeURIComponent(query);
  }

  let response = await fetch_retry(5, blacklistURL, {
    method: 'GET',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  });

  let blacklistData = await response.json();
  return blacklistData;
};
