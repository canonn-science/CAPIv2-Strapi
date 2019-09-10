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

let reportTypes = [
  'ap', 'bm', 'bt', 'cs', 'fg', 'fm', 'gv', 'gy', 'ls', 'tb', 'tw'
];

let reportStatus = [
  'pending', 'accepted', 'duplicate', 'declined', 'issue'
];

let getCount = async (reportType) => {
  console.log(reportType);
  const response = await fetch(url + `/${reportType}reports/count?reportStatus=pending`, {
    method: 'GET',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
  });

  const count = await response.text();
  return count;
};

let getSystem = async (system) => {
  const response = await fetch(url + `/systems?systemName=${system}`, {
    method: 'GET',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
  });

  const systemData = await response.JSON();
  return systemData;
};

let createSystem = async (system) => {

};

let getBody = async (body) => {
  const response = await fetch(url + `/bodies?bodyName=${body}`, {
    method: 'GET',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
  });

  const bodyData = await response.JSON();
  return bodyData;
};

let createBody = (body) => {

};

let getTypes = async (reportType, type) => {
  const response = await fetch(url + `/${reportType}types?type=` + encodeURIComponent(type), {
    method: 'GET',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
  });

  const typeData = await response.JSON();
  return typeData;
};

let validateReports = async () => {
  for (let i = 0; i < reportTypes.length; i++) {
    if (await getCount(reportTypes[i]) > 0) {
      console.log('running validation');
    }
  }
};

validateReports();
