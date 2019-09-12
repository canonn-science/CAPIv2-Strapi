const fetch = require('node-fetch');
const delay = ms => new Promise(res => setTimeout(res, ms));

// Script Function to fetch and retry x times if error

const fetch_retry = async (retryCount, url, options) => {
  try {
    return await fetch(url, options);
  } catch (error) {
    if (retryCount === 1) console.log(error);
    delay(5000);
    return await fetch_retry(url, options, retryCount - 1);
  }
};
