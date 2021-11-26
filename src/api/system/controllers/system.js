'use strict';

/**
 *  system controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::system.system');
