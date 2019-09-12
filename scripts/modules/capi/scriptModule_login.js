const fetch = require('node-fetch');

const login = async (url, username, password) => {
  // set body information to .env options
  let body = {
    identifier: username,
    password: password,
  };

  // try logging in or log the error
  try {
    const response = await fetch(url + '/auth/local', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(body),
    });

    // waiting for login response
    const json = await response.json();

    // set jwt after response is received
    let jwt = json.jwt;
    return jwt;
  } catch (error) {
    console.log(error);
  }
};

module.exports = {login};
