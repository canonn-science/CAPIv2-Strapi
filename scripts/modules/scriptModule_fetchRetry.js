const moment = require('moment');
const fetch = require('node-fetch');
const delay = ms => new Promise(res => setTimeout(res, ms));

// Script Function to fetch and retry x times if error
const fetch_retry = async (retryCount, url, options) => {

  try {
    let data = await fetch(url, options);
    if (data.status === 429 && retryCount >= 1) {
      console.log(
        moment()
          .utc()
          .format() + ' - EDSM API Limit Reached, waiting 5 minutes'
      );
      await delay(300000);
      console.log(
        moment()
          .utc()
          .format() + ' - Waited 5 minutes, retrying'
      );
      return await fetch_retry(url, options, (retryCount - 1));
    } else if (data.status === 429 && retryCount < 1) {
      console.log(
        moment()
          .utc()
          .format() + ' - EDSM Error unable to get data'
      );
      return {};
    } else {
      return data;
    }
  } catch (error) {
    if (retryCount <= 1) console.log(error);
    await delay(5000);
    return await fetch_retry(url, options, (retryCount - 1));
  }
};

module.exports = {fetch_retry};
