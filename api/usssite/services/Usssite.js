'use strict';

/**
 * Usssite.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all usssites.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    const convertedParams = strapi.utils.models.convertParams('usssite', params);

    return Usssite.query(function(qb) {
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
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.usssite.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to fetch a/an usssite.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    return Usssite.forge(_.pick(params, 'id')).fetch({
      withRelated: _.keys(_.groupBy(_.reject(strapi.models.usssite.associations, {autoPopulate: false}), 'alias'))
    });
  },

  /**
   * Promise to add a/an usssite.
   *
   * @return {Promise}
   */

  add: async (values) => {
    const data = await Usssite.forge(_.omit(values, _.keys(_.groupBy(strapi.models.usssite.associations, 'alias')))).save();
    await strapi.hook.bookshelf.manageRelations('usssite', _.merge(_.clone(data.toJSON()), { values }));
    return data;
  },

  /**
   * Promise to edit a/an usssite.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    await strapi.hook.bookshelf.manageRelations('usssite', _.merge(_.clone(params), { values }));
    return Usssite.forge(params).save(_.omit(values, _.keys(_.groupBy(strapi.models.usssite.associations, 'alias'))), {path: true});
  },

  /**
   * Promise to remove a/an usssite.
   *
   * @return {Promise}
   */

  remove: (params) => {
    _.forEach(Usssite.associations, async association => {
      await Usssite.forge(params)[association.alias]().detach();
    });
    return Usssite.forge(params).destroy();
  }
};
