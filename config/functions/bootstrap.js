'use strict';

/**
 * An asynchronous bootstrap function that runs before
 * your application gets started.
 *
 * This gives you an opportunity to set up your data model,
 * run jobs, or perform some special logic.
 */

// Load environment variables
// Pending this PR: https://github.com/strapi/strapi/pull/3453
//require('dotenv').config({ path: require('find-config')('.env') });

module.exports = cb => {
  cb();
};
