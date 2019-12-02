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

    let compareStar = async (common, data) => {
      // Lookup most/least common star type with count
    };

    let compareBodyMath = async (metric, data) => {
      // Get Min, Max, Average values
      let dataToParse;

      if (metric === 'latitude'){
        dataToParse = data.map(i => i.latitude);
      } else if (metric === 'longitude') {
        dataToParse = data.map(i => i.longitude);
      } else {
        //
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

    let compareBodyType = async (metric, data) => {
      // Get Min, Max, Average values
    };

    let typeCount = async (typeData, data) => {
      // Get counts of each type
    };

    // Construct stats
    let stats = {
      system: {
        mostCommonStar: compareStar(true, siteData),
        leastCommonStar: compareStar(false, siteData)
      },
      body: {
        latitude: await compareBodyMath('latitude', siteData),
        longitude: await compareBodyMath('longitude', siteData),
        subType: compareBodyType('subType', siteData),
        distanceToArrival: compareBodyMath('distanceToArrival', siteData),
        gravity: compareBodyMath('gravity', siteData),
        earthMasses: compareBodyMath('earthMasses', siteData),
        radius: compareBodyMath('radius', siteData),
        surfaceTemperature: compareBodyMath('surfaceTemperature', siteData),
        volcanismType: compareBodyType('volcanismType', siteData),
        atmosphereType: compareBodyType('atmosphereType', siteData),
        terraformingState: compareBodyType('terraformingState', siteData),
        orbitalPeriod: compareBodyMath('orbitalPeriod', siteData),
        semiMajorAxis: compareBodyMath('semiMajorAxis', siteData),
        orbitalEccentricity: compareBodyMath('orbitalEccentricity', siteData),
        orbitalInclination: compareBodyMath('orbitalInclination', siteData),
        argOfPeriapsis: compareBodyMath('argOfPeriapsis', siteData),
        rotationalPeriod: compareBodyMath('rotationalPeriod', siteData),
        rotationalPeriodTidallyLocked: '',
        axialTilt: compareBodyMath('axialTilt', siteData)
      },
      siteCount: parseInt(sitecount),
      type: typeCount(typeData)
    };

    return stats;
  }
};
