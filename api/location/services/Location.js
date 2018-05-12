'use strict';

/**
 * Location.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all locations.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.utils.models.convertParams('location', params);

    return Location.query(function(qb) {
      _.forEach(convertedParams.where, (where, key) => {
        if (_.isArray(where.value)) {
          for (const value in where.value) {
            qb[value ? 'where' : 'orWhere'](key, where.symbol, where.value[value])
          }
        } else {
          qb.where(key, where.symbol, where.value);
        }
      });

      if (convertedParams.sort) {
        qb.orderBy(convertedParams.sort.key, convertedParams.sort.order);
      }

      qb.offset(convertedParams.start);

      qb.limit(convertedParams.limit);
    }).fetchAll({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.location.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an location.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    return Location.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.location.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to add a/an location.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Location.forge(_.omit(values, _.keys(_.groupBy(strapi.models.location.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('location', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an location.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('location', _.merge(_.clone(params), { values }));
    return Location.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.location.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an location.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Location.associations, async association => {
      await Location.forge(params)[association.alias]().detach();
    });
    return Location.forge(params).destroy();
  }
};
