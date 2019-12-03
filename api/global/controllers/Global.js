'use strict';

/**
 * Info.js controller
 *
 * @description: A set of functions called "actions" for managing `Info`.
 */

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
      capiVersion: strapi.config.info.version
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

  stats: async (ctx) => {
    let approvedList = [
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

    let siteData;
    let siteCount;

    if (ctx.query.type && approvedList.includes(ctx.query.type.toLowerCase())) {
      // Fetch all data
      siteData = await strapi.query(ctx.query.type.toLowerCase() + 'site').find({ _limit: -1 });
      siteCount = await strapi.query(ctx.query.type.toLowerCase() + 'site').count();
    } else {
      ctx.status = 400;
      ctx.message = `The type ${ctx.query.type.toLowerCase()} either doesn't exist or does not allow stat lookups`;

      return {
        statusCode: ctx.status,
        error: 'Type is not supported',
        message: ctx.message
      };
    }

    let compareBodyMath = async (metric, data) => {
      // Get Min, Max, Average values
      let dataToParse;

      if (metric === 'latitude'){
        dataToParse = data.map(i => i.latitude);
      } else if (metric === 'longitude') {
        dataToParse = data.map(i => i.longitude);
      } else {
        dataToParse = data.map(i => i.body[metric]);
      }

      if (dataToParse) {
        let stats = {
          min: Math.min.apply(null, dataToParse),
          max: Math.max.apply(null, dataToParse),
          average: dataToParse.reduce((a,b) => a + b, 0) / dataToParse.length
        };

        return stats;
      } else {
        return {};
      }
    };

    let compareText = async (metric, data) => {
      let dataToParse;
      let stats = {};

      // Map the Data
      if (metric === 'star') {
        dataToParse = data.map(i => i.system.primaryStar.type);
      } else if (metric === 'type') {
        dataToParse = data.map(i => i.type.type);
      } else if (metric === 'status') {
        dataToParse = data.map(i => i.status.status);
      } else {
        dataToParse = data.map(i => i.body[metric]);
      }

      // Make sure data is there and add them to an object with a count
      if (dataToParse) {
        let uniqueValues = dataToParse.filter((x, i, a) => a.indexOf(x) === i);

        // Populate the object with a count of each unique
        uniqueValues.forEach((item) => {
          if (item) {
            stats[item] = dataToParse.filter(x => { return x === item; }).length;
          }
        });
      }

      return stats;
    };

    // Construct stats
    let stats = {
      siteCount: parseInt(siteCount),
      system: {
        primaryStar: await compareText('star', siteData)
      },
      body: {
        latitude: await compareBodyMath('latitude', siteData),
        longitude: await compareBodyMath('longitude', siteData),
        subType: await compareText('subType', siteData),
        distanceToArrival: await compareBodyMath('distanceToArrival', siteData),
        gravity: await compareBodyMath('gravity', siteData),
        earthMasses: await compareBodyMath('earthMasses', siteData),
        radius: await compareBodyMath('radius', siteData),
        surfaceTemperature: await compareBodyMath('surfaceTemperature', siteData),
        volcanismType: await compareText('volcanismType', siteData),
        atmosphereType: await compareText('atmosphereType', siteData),
        terraformingState: await compareText('terraformingState', siteData),
        orbitalPeriod: await compareBodyMath('orbitalPeriod', siteData),
        semiMajorAxis: await compareBodyMath('semiMajorAxis', siteData),
        orbitalEccentricity: await compareBodyMath('orbitalEccentricity', siteData),
        orbitalInclination: await compareBodyMath('orbitalInclination', siteData),
        argOfPeriapsis: await compareBodyMath('argOfPeriapsis', siteData),
        rotationalPeriod: await compareBodyMath('rotationalPeriod', siteData),
        axialTilt: await compareBodyMath('axialTilt', siteData)
      },
    };

    if (ctx.query.type === 'ts') {
      stats.status = await compareText('status', siteData);
    } else {
      stats.type = await compareText('type', siteData);
    }

    return stats;
  }
};
