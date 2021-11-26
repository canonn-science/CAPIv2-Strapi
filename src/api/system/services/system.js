'use strict';

/**
 * system service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::system.system');
