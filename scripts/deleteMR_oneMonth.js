const fetch = require('node-fetch');
const moment = require('moment');
const cron = require('node-cron');
require('dotenv').config({ path: require('find-config')('.env') });

// Setting URL for each server
let url = null;
if (process.env.NODE_ENV == 'production') {
  url = process.env.SCRIPT_PROD;
} else if (process.env.NODE_ENV == 'staging') {
  url = process.env.SCRIPT_STAG;
} else {
  url = process.env.SCRIPT_DEV;
}

// Declaring jwt as a variable and forming login function
let jwt = null;
const login = async () => {

  // set body information to .env options
  let body = {
    'identifier': process.env.SCRIPT_USER,
    'password': process.env.SCRIPT_PASS
  };

  // try logging in or log the error
  try {
    const response = await fetch(url + '/auth/local', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(body)
    });

    // waiting for login response
    const json = await response.json();

    // set jwt after response is received
    jwt = json.jwt;

  } catch (error) {
    console.log(error);
  }
};

// Declaring mrRecords and setting function to get records
let mrRecords = null;
const getRecords = async () => {

  // Define filters for MR records older that x months
  const month = process.env.SCRIPT_MR_MONTH;
  const now = moment();
  let deleteTime = now.subtract(month, 'months').utc().format('YYYY-MM-DD hh:mm:ss');

  // Try to grab records or log error
  try {
    const response = await fetch(url + '/materialreports' + `?_limit=${process.env.SCRIPT_MR_LIMIT}` + '&created_at_lte=' + deleteTime + '&_sort=created_at:asc');

    mrRecords = await response.json();

  } catch (error) {
    console.log(error);
  }
};

// Deleting records calling login and getRecords if needed
const deleteRecords = async () => {

  // Applying sleep offset for multiple servers
  const delay = ms => new Promise(res => setTimeout(res, ms));
  let timeout = process.env.SCRIPT_OFFSET * 1000;
  await delay(timeout);

  // Login and get JWT
  login();

  // Grab Records
  await getRecords();

  // Check if there is records to delete
  if (mrRecords.length > 0) {
    for (let i=0; i < mrRecords.length; i++) {
      try {
        await fetch(url + '/materialreports' + `/${mrRecords[i].id}`, {
          method: 'DELETE',
          headers: {
            'Accept': 'application/json',
            'Authorization': `Bearer ${jwt}`
          }
        });

        // Hard coded delay to not overload the CAPIv2
        await delay(10);

      } catch (error) {
        console.log(error);
      }
    }
  }
};

if (process.env.SCRIPT_MR_DELETE === 'true') {
  cron.schedule(process.env.SCRIPT_MR_CRON, () => {
    deleteRecords();
  });
} else {
  console.log('This script has been disabled');
  process.exit(0);
}
