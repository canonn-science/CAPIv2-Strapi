#!/usr/bin/env node
'use strict';

// Load environment variables
require('dotenv').config({ path: require('find-config')('.env') });

// Start Strapi
const strapi = require('strapi');
strapi().start();