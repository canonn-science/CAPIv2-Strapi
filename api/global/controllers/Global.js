'use strict';

/**
 * Info.js controller
 *
 * @description: A set of functions called 'actions' for managing `Info`.
 */

module.exports = {
  /**
   * Retrieve CAPI Info.
   *
   * @return {Object}
   */

  info: ctx => {
    ctx.send({
      name: strapi.config.info.name,
      description: strapi.config.info.description,
      email: strapi.config.info.author.email,
      strapiVersion: strapi.config.info.strapi,
      capiVersion: strapi.config.info.version
    });
  },

  /**
   * Retrieve CAPI Version.
   *
   * @return {Object}
   */

  version: ctx => {
    ctx.send({
      strapiVersion: strapi.config.info.strapi,
      capiVersion: strapi.config.info.version
    });
  },

  /**
   * Get count of all Sites and Reports.
   *
   * @return {Object}
   */

  totalCount: () => {
    return strapi.services.global.totalCount();
  },

  /**
   * Retrieve Stats based on type
   *
   * @return {Array}
   */

  stats: async ctx => {
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
      'tw'
    ];

    const fields = [
      'system',

      'primaryStar',
      'primaryStar.type',
      'primaryStar.isScoopable',

      'body',
      'body.subType',
      'body.distanceToArrival',
      'body.gravity',
      'body.earthMasses',
      'body.radius',
      'body.surfaceTemperature',
      'body.volcanismType',
      'body.atmosphereType',
      'body.terraformingState',
      'body.orbitalPeriod',
      'body.semiMajorAxis',
      'body.orbitalEccentricity',
      'body.orbitalInclination',
      'body.argOfPeriapsis',
      'body.rotationalPeriod',
      'body.axialTilt',

      'latitude',
      'longitude',

      'type',
      'type.type',

      'status',
      'status.status'
    ];

    let siteData;

    if (ctx.query.type && approvedList.includes(ctx.query.type.toLowerCase())) {
      // Fetch all data
      siteData = await strapi
        .query(ctx.query.type.toLowerCase() + 'site')
        .find({ _limit: -1 });

      // You don't have to do it. siteCount should be equal to siteData.length, no?
      // You are making another strapi query here, which probably takes way more time than the calculations below.
      // Unless I'm wrong?

      //siteCount = await strapi.query(ctx.query.type.toLowerCase() + 'site').count();
    } else {
      ctx.status = 400;
      ctx.message = `The type ${ctx.query.type.toLowerCase()} either doesn't exist or does not allow stat lookups`;

      return {
        statusCode: ctx.status,
        error: 'Type is not supported',
        message: ctx.message
      };
    }

    // See above
    let siteCount = siteData.length;

    // This is your final object, magic happens below.
    let stats = {};

    // This function loops over keys of an object (site) and updates the 'stats' object
    // This is a recursive function, meaning if a value of a key is an object (not string, number, boolean) it fires up again

    function loopOverKeys(parent, object) {
      let keys = Object.keys(object);

      keys.forEach(key => {
        if (fields.indexOf(key) !== -1) {
          let value = object[key];

          // If the value is an object
          if (typeof value === 'object' && value) {
            // If it's not yet in stats, create a new stats[key] with an empty object
            if (typeof parent[key] === 'undefined') {
              parent[key] = {};
            }

            // Fire up recursion
            loopOverKeys(parent[key], value);

            // For strings and booleans we make a histogram
          } else if (typeof value === 'string' || typeof value === 'boolean') {
            // Just checking if we have a key for histogram, if not we create one
            if (typeof parent[key] === 'undefined') {
              parent[key] = {};
            }

            // If the value isn't in histogram yet, create a new one and set count to 1
            if (typeof parent[key][value] === 'undefined') {
              parent[key][value] = 1;

              // If the value is already in histogram, increase the count by 1
            } else {
              parent[key][value] += 1;
            }

            // For numbers we're going to count max, min and average
          } else if (typeof value === 'number') {
            // Check if the key is already there. If not create one.
            if (typeof parent[key] === 'undefined') {
              parent[key] = {
                min: Number.POSITIVE_INFINITY,
                max: Number.NEGATIVE_INFINITY,
                avgSum: 0,
                avgCount: 0
              };
            }

            // Check max
            if (value > parent[key].max) {
              parent[key].max = value;
            }

            // Check min
            if (value < parent[key].min) {
              parent[key].min = value;
            }

            // This is for average, we got sum and count, so we can count all averages after the loop.
            // I'll come back to this after we establish it's working.
            parent[key].avgSum += value;
            parent[key].avgCount += 1;
          }
        }
      });
    }

    // One loop to rule them all
    siteData.forEach(site => {
      loopOverKeys(stats, site);
    });

    // Console log stats here, or something, just check the data
    console.log('STATS', stats);

    // if (ctx.query.type === 'ts') {
    //   stats.status = await compareText('status', siteData);
    // } else {
    //   stats.type = await compareText('type', siteData);
    // }

    return stats;
  }
};
