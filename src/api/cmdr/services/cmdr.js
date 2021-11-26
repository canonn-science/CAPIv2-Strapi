'use strict';

/**
 * cmdr service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::cmdr.cmdr');
