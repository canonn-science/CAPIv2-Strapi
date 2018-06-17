'use strict';

/**
 * Gsreport.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all gsreports.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('gsreport', params);
    // Select field to populate.
    const populate = Gsreport.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Gsreport.query(function(qb) {
      _.forEach(filters.where, (where, key) => {
        if (_.isArray(where.value)) {
          for (const value in where.value) {
            qb[value ? 'where' : 'orWhere'](key, where.symbol, where.value[value])
          }
        } else {
          qb.where(key, where.symbol, where.value);
        }
      });

      if (filters.sort) {
        qb.orderBy(filters.sort.key, filters.sort.order);
      }

      qb.offset(filters.start);
      qb.limit(filters.limit);
    }).fetchAll({
      withRelated: populate
    });
  },

  /**
   * Promise to fetch a/an gsreport.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Gsreport.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Gsreport.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an gsreport.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('gsreport', params);

    return Gsreport.query(function(qb) {
      _.forEach(filters.where, (where, key) => {
        if (_.isArray(where.value)) {
          for (const value in where.value) {
            qb[value ? 'where' : 'orWhere'](key, where.symbol, where.value[value])
          }
        } else {
          qb.where(key, where.symbol, where.value);
        }
      });
    }).count();
  },

  /**
   * Promise to add a/an gsreport.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Gsreport.associations.map(ast => ast.alias));
    const data = _.omit(values, Gsreport.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Gsreport.forge(data).save();

    // Create relational data and return the entry.
    return Gsreport.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an gsreport.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Gsreport.associations.map(ast => ast.alias));
    const data = _.omit(values, Gsreport.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Gsreport.forge(params).save(data, { path: true });

    // Create relational data and return the entry.
    return Gsreport.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an gsreport.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    await Promise.all(
      Gsreport.associations.map(association =>
        Gsreport.forge(params)[association.alias]().detach()
      )
    );

    return Gsreport.forge(params).destroy();
  }
};
