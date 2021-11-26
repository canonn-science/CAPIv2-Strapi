'use strict';

/**
 * body service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::body.body');
