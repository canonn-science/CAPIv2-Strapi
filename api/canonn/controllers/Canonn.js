'use strict';
const fetch = require('node-fetch');
const pluralize = require('pluralize');
const { sanitizeEntity } = require('strapi-utils');
const yup = require('yup');

/**
 * Info.js controller
 *
 * @description: A set of functions called 'actions' for managing `Info`.
 */

const formatError = (error) => [
  { messages: [{ id: error.id, message: error.message, field: error.field }] },
];

module.exports = {
  /**
   * Retrieve CAPI Info.
   *
   * @return {Object}
   */

  info: (ctx) => {
    ctx.send({
      name: strapi.config.info.name,
      description: strapi.config.info.description,
      email: strapi.config.info.author.email,
      strapiVersion: strapi.config.info.strapi,
      capiVersion: strapi.config.info.version,
    });
  },

  /**
   * Retrieve CAPI Version.
   *
   * @return {Object}
   */

  version: (ctx) => {
    ctx.send({
      strapiVersion: strapi.config.info.strapi,
      capiVersion: strapi.config.info.version,
    });
  },

  /**
   * Retrieve Model Attributes.
   *
   * @return {Object}
   */

  modelInfo: async (ctx) => {
    if (!ctx.query.model) {
      return ctx.badRequest('Model is required');
    } else if (!(ctx.query.model in strapi.models)) {
      return ctx.badRequest("Model doesn't exist");
    }
    let perm = await strapi
      .query('permission', 'users-permissions')
      .find({ controller: ctx.query.model, role: 3, action: 'find' });

    if (!perm || !perm[0].id) {
      return ctx.unauthorized('You are not authorized to see this model structure');
    }

    return strapi.models[ctx.query.model].allAttributes;
  },

  /**
   * Submit basic report and pass report to correct report model.
   *
   * @return {Object}
   */

  // WIP Will NOT support non-standard models such as TS/GEN/GB
  // TODO: Maybe support bulk? Map an array and create multiple reports

  submitReport: async (ctx) => {
    let requestBody = ctx.request.body;
    let format =
      typeof ctx.request.headers.reportformat != 'undefined'
        ? ctx.request.headers.reportformat
        : 'unknown';
    let model;
    let type;

    // Find type for model lookup
    if (requestBody.type) {
      type = await strapi.query('reporttype').findOne({ type: requestBody.type });
    } else if (requestBody.raw_json.EntryID) {
      type = await strapi.query('reporttype').findOne({ journalID: requestBody.raw_json.EntryID });
    } else {
      return ctx.badRequest('Cannot determine report type');
    }

    // Set model based on type
    if (type && type.endpoint) {
      model = pluralize.singular(type.endpoint);
    }

    // TODO: Validate incoming data base on model & type (TB/GR/GS) using yup
    let reportSchema = yup.object().shape({
      cmdrName: yup.string().required(),
      clientVersion: yup.string.required(),
      isBeta: yup.boolean().required(),
    });

    // Send report to correct model, sanitize input
    if (model) {
      console.log(model);
      let sentData = await strapi.query(model).create(requestBody);
      let cleanData = sanitizeEntity(sentData, { model: strapi.models[model] });
      cleanData.model = model;
      return cleanData;
    }

    // If data doesn't match a model, forward data to debug model 'reportcodex'
    let rawJson = requestBody.rawJson;

    async function getFrontierID(dest) {
      if (dest) {
        return dest
          .match(/index=\d/g)
          .replace(/index=/g)
          .parseInt();
      } else {
        return undefined;
      }
    }

    let debugData = {
      // Data sent outside of rawJson
      cmdrName: requestBody.cmdrName,
      clientVersion: requestBody.clientVersion,
      isBeta: requestBody.isBeta,
      reportStatus: 'pending',
      rawJson,
      // Extracted and cleaned values from rawJson
      systemName: rawJson.System.toUpperCase(),
      bodyName: undefined, // TODO: Ask LCU if he is going to send this
      systemAddress: rawJson.SystemAddress,
      latitude: undefined, // TODO: Ask LCU if he is going to send this
      longitude: undefined, // TODO: Ask LCU if he is going to send this
      frontierID: getFrontierID(rawJson.NearestDestination),
      entryId: rawJson.EntryID,
      codexName: rawJson.Name,
      codexNameLocalised: rawJson.Name_Localised,
      subCategory: rawJson.SubCategory,
      subCategoryLocalised: rawJson.SubCategory_Localised,
      category: rawJson.Category,
      categoryLocalised: rawJson.Category_Localised,
      regionName: rawJson.Region,
      regionLocalised: rawJson.Region_Localised,
      voucherAmount: rawJson.VoucherAmount,
    };

    let sentDebug = await strapi.query('reportcodex').create(debugData);
    let cleanDebug = sanitizeEntity(sentDebug, { model: strapi.models.reportcodex });
    if (cleanDebug) {
      cleanDebug.model = 'reportcodex';
      cleanDebug.isDebug = true;
      return cleanDebug;
    }
    return ctx.badRequest(
      "An error occurred posting your data to our debug model, and your data doesn't match any type map" // eslint-disable-line
    );
  },

  /**
   * Search for nearby systems.
   *
   * @return {Object}
   */

  nearby: async (ctx) => {
    // Making code easier to read
    let query = ctx.request.query;

    // Checking for required query params
    if (query.systemName && query.distance) {
      // Ask CAPI first if we have the system so we don't spam EDSM
      let system = await strapi.query('system').find({ systemName: query.systemName });

      // Not in CAPI, Ask EDSM
      if (!system || system.length === 0) {
        let edsmFetch = await fetch(
          'https://www.edsm.net/api-v1/system?showCoordinates=1&systemName=' +
            encodeURIComponent(query.systemName)
        );

        system = await edsmFetch.json();
      }

      // Check if both CAPI and EDSM don't have the system
      // TO_DO: Add a way to send direct x/y/z instead of system lookup
      if (
        !system.coords &&
        (!system[0].edsmCoordX || !system[0].edsmCoordY || !system[0].edsmCoordZ)
      ) {
        return ctx.badRequest('System cannot be found, are you sending data to EDSM?');
      } else {
        let coords;

        // Switch coords based on if CAPI/EDSM is being used
        if (system.coords) {
          coords = {
            x: system.coords.x,
            y: system.coords.y,
            z: system.coords.z,
          };
        } else {
          coords = {
            x: system[0].edsmCoordX,
            y: system[0].edsmCoordY,
            z: system[0].edsmCoordZ,
          };
        }

        // Fetch systems in a boundry box and return them
        let params = {
          edsmCoordX_gte: coords.x - query.distance / 2,
          edsmCoordX_lte: coords.x + query.distance / 2,
          edsmCoordY_gte: coords.y - query.distance / 2,
          edsmCoordY_lte: coords.y + query.distance / 2,
          edsmCoordZ_gte: coords.z - query.distance / 2,
          edsmCoordZ_lte: coords.z + query.distance / 2,
          _start: parseInt(query._start) || 0,
        };

        let systemFetch = await strapi.query('system').find(params);
        ctx.set('Content-Range', await strapi.query('system').count(params));
        return systemFetch;
      }
    } else {
      let missing = [];
      if (!query.systemName || typeof query.systemName !== 'string') {
        missing.push({ systemName: 'systemName must be defined and a string' });
      }

      if (!query.distance || isNaN(query.distance) === true || query.distance > 100) {
        missing.push({
          distance: 'distance must be defined, an integer, and less than 100',
        });
      }

      if (missing.length > 0) {
        return ctx.badRequest('MissingQueryParameters', { errors: missing });
      }

      return ctx.badRequest('Unknown Error');
    }
  },

  /**
   * Get count of all Sites and Reports.
   *
   * @return {Object}
   */

  totalCount: async (ctx) => {
    let sites = {
      ap: {},
      bm: {},
      bt: {},
      cs: {},
      fg: {},
      fm: {},
      gen: {},
      gb: {},
      gr: {},
      gs: {},
      gv: {},
      gy: {},
      ls: {},
      tb: {},
      ts: {},
      tw: {},
    };

    let totals = {
      sites: 0,
      reports: {
        pending: 0,
        accepted: 0,
        duplicate: 0,
        declined: 0,
        issue: 0,
        total: 0,
      },
    };

    const getCount = async (key) => {
      let data = {
        sites: await strapi.services[`${key}site`].count(),
        reports: {
          pending: await strapi.services[`${key}report`].count({
            reportStatus: 'pending',
          }),
          accepted: await strapi.services[`${key}report`].count({
            reportStatus: 'accepted',
          }),
          duplicate: await strapi.services[`${key}report`].count({
            reportStatus: 'duplicate',
          }),
          declined: await strapi.services[`${key}report`].count({
            reportStatus: 'declined',
          }),
          issue: await strapi.services[`${key}report`].count({
            reportStatus: 'issue',
          }),
          total: await strapi.services[`${key}report`].count({}),
        },
      };

      let noType = ['gen', 'gb', 'ts'];
      if (noType.indexOf(key) == -1) {
        data.types = {};
        let getTypes = await strapi.services[`${key}type`].find();

        for (let i = 0; i < getTypes.length; i++) {
          data.types[getTypes[i].type] = await strapi.services[`${key}site`].count({
            type: getTypes[i].id,
          });
        }
      } else if (key === 'ts') {
        data.status = {
          Unknown: await strapi.services.tssite.count({ status: 1 }),
          Active: await strapi.services.tssite.count({ status: 2 }),
          Inactive: await strapi.services.tssite.count({ status: 3 }),
        };
      }

      return data;
    };

    const setCount = async (sites) => {
      let keys = Object.keys(sites);
      for (let i = 0; i < keys.length; i++) {
        let count = await getCount(keys[i]);
        sites[`${keys[i]}`] = count;
        totals.sites = parseInt(totals.sites) + parseInt(count.sites);
        totals.reports.pending = parseInt(totals.reports.pending) + parseInt(count.reports.pending);
        totals.reports.accepted =
          parseInt(totals.reports.accepted) + parseInt(count.reports.accepted);
        totals.reports.duplicate =
          parseInt(totals.reports.duplicate) + parseInt(count.reports.duplicate);
        totals.reports.declined =
          parseInt(totals.reports.declined) + parseInt(count.reports.declined);
        totals.reports.issue = parseInt(totals.reports.issue) + parseInt(count.reports.issue);
        totals.reports.total = parseInt(totals.reports.total) + parseInt(count.reports.total);
      }
    };

    await setCount(sites);

    return {
      total: totals,
      data: sites,
    };
  },

  /**
   * Retrieve Stats based on type
   *
   * @return {Array}
   */

  stats: async (ctx) => {
    const approvedList = [
      'ap',
      'bm',
      'bt',
      'cs',
      'fg',
      'fm',
      'gr',
      'gs',
      'gv',
      'gy',
      'ls',
      'tb',
      'ts',
      'tw',
    ];

    let siteData;

    if (ctx.query.type && approvedList.includes(ctx.query.type.toLowerCase())) {
      // Fetch all data
      siteData = await strapi.query(ctx.query.type.toLowerCase() + 'site').find({ _limit: -1 });
    } else {
      ctx.status = 400;
      ctx.message = `The type ${ctx.query.type.toLowerCase()} either doesn't exist or does not allow stat lookups`;

      return {
        statusCode: ctx.status,
        error: 'Type is not supported',
        message: ctx.message,
      };
    }

    function updateKeyObject(object, value) {
      if (value) {
        if (!object[value]) {
          object[value] = 1;
        } else {
          object[value] += 1;
        }
      }
    }

    function updateKeyMath(object, value) {
      if (value || value === 0) {
        if (!object.avgCount) {
          object.min = value;
          object.max = value;
          object.avgSum = value;
          object.avgCount = 1;
        } else {
          object.min = object.min > value ? (object.min = value) : object.min;
          object.max = object.max < value ? (object.max = value) : object.max;
          object.avgSum += value;
          object.avgCount += 1;
          object.average = object.avgSum / object.avgCount;
        }
      }
    }

    let stats = {
      siteCount: siteData.length,
      system: {
        primaryStar: {},
      },

      body: {
        latitude: {},
        longitude: {},
        subType: {},
        distanceToArrival: {},
        gravity: {},
        earthMasses: {},
        radius: {},
        surfaceTemperature: {},
        volcanismType: {},
        //atmosphereType: {}, // You probably don't need this?
        terraformingState: {},
        orbitalPeriod: {},
        semiMajorAxis: {},
        orbitalEccentricity: {},
        orbitalInclination: {},
        argOfPeriapsis: {},
        rotationalPeriod: {},
        axialTilt: {},
      },

      type: {
        type: {},
      },
    };

    siteData.forEach((site) => {
      // System
      updateKeyObject(stats.system.primaryStar, site.system.primaryStar.type);

      // Body
      updateKeyMath(stats.body.latitude, site.latitude);
      updateKeyMath(stats.body.longitude, site.longitude);
      updateKeyMath(stats.body.distanceToArrival, site.body.distanceToArrival);
      updateKeyMath(stats.body.gravity, site.body.gravity);
      updateKeyMath(stats.body.earthMasses, site.body.earthMasses);
      updateKeyMath(stats.body.radius, site.body.radius);
      updateKeyMath(stats.body.surfaceTemperature, site.body.surfaceTemperature);
      updateKeyMath(stats.body.orbitalPeriod, site.body.orbitalPeriod);
      updateKeyMath(stats.body.semiMajorAxis, site.body.semiMajorAxis);
      updateKeyMath(stats.body.orbitalEccentricity, site.body.orbitalEccentricity);
      updateKeyMath(stats.body.orbitalInclination, site.body.orbitalInclination);
      updateKeyMath(stats.body.argOfPeriapsis, site.body.argOfPeriapsis);
      updateKeyMath(stats.body.rotationalPeriod, site.body.rotationalPeriod);
      updateKeyMath(stats.body.axialTilt, site.body.axialTilt);

      updateKeyObject(stats.body.subType, site.body.subType);
      updateKeyObject(stats.body.volcanismType, site.body.volcanismType);
      updateKeyObject(stats.body.terraformingState, site.body.terraformingState);

      // Type
      updateKeyObject(stats.type.type, site.type.type);
    });

    return stats;
  },
};
