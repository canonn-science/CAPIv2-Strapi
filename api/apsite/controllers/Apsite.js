'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/controllers.html#core-controllers)
 * to customize this controller
 */

module.exports = {
  /**
   * Retrieve records with count in `Content-Range` header.
   *
   * @return {Array}
   */

  find: async (ctx) => {
    if (ctx.query._q) {
      ctx.set('Content-Range', await strapi.services.apsite.countSearch(ctx.query));
      return strapi.services.apsite.search(ctx.query);
    }

    ctx.set('Content-Range', await strapi.services.apsite.count(ctx.query));
    return strapi.services.apsite.find(ctx.query);
  },

  /**
   * Retrieve records with count in `Content-Range` header.
   *
   * @return {Array}
   */

  stats: async (ctx) => {
    // Fetch all data
    let siteData = await strapi.query('apsite').find({ _limit: -1 });
    let sitecount = await strapi.query('apsite').count();
    let typeData = await strapi.query('aptype').find({ _limit: -1 });

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

      if (metric === 'star') {
        dataToParse = data.map(i => i.system.primaryStar.type);
      } else {
        //
      }

      if (dataToParse) {
        // Do common/uncommon lookups
      }
    };

    let typeCount = async (typeData, data) => {
      // Get counts of each type
    };

    // Construct stats
    let stats = {
      siteCount: parseInt(sitecount),
      system: await compareText('star', siteData),
      body: {
        latitude: await compareBodyMath('latitude', siteData),
        longitude: await compareBodyMath('longitude', siteData),
        subType: compareText('subType', siteData),
        distanceToArrival: await compareBodyMath('distanceToArrival', siteData),
        gravity: await compareBodyMath('gravity', siteData),
        earthMasses: await compareBodyMath('earthMasses', siteData),
        radius: await compareBodyMath('radius', siteData),
        surfaceTemperature: await compareBodyMath('surfaceTemperature', siteData),
        volcanismType: compareText('volcanismType', siteData),
        atmosphereType: compareText('atmosphereType', siteData),
        terraformingState: compareText('terraformingState', siteData),
        orbitalPeriod: await compareBodyMath('orbitalPeriod', siteData),
        semiMajorAxis: await compareBodyMath('semiMajorAxis', siteData),
        orbitalEccentricity: await compareBodyMath('orbitalEccentricity', siteData),
        orbitalInclination: await compareBodyMath('orbitalInclination', siteData),
        argOfPeriapsis: await compareBodyMath('argOfPeriapsis', siteData),
        rotationalPeriod: await compareBodyMath('rotationalPeriod', siteData),
        rotationalPeriodTidallyLocked: '',
        axialTilt: await compareBodyMath('axialTilt', siteData)
      },
      type: typeCount(typeData)
    };

    return stats;
  }
};
