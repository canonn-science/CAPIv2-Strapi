'use strict';

/**
 * Journaldata.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all journaldata.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('journaldata', params);
    // Select field to populate.
    const populate = Journaldata.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Journaldata.query(function(qb) {
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
   * Promise to fetch a/an journaldata.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Journaldata.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Journaldata.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an journaldata.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('journaldata', params);

    return Journaldata.query(function(qb) {
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
   * Promise to add a/an journaldata.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Journaldata.associations.map(ast => ast.alias));
    const data = _.omit(values, Journaldata.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Journaldata.forge(data).save();

    // Create relational data and return the entry.
    return Journaldata.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an journaldata.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Journaldata.associations.map(ast => ast.alias));
    const data = _.omit(values, Journaldata.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Journaldata.forge(params).save(data, { path: true });

    // Create relational data and return the entry.
    return Journaldata.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an journaldata.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    await Promise.all(
      Journaldata.associations.map(association =>
        Journaldata.forge(params)[association.alias]().detach()
      )
    );

    return Journaldata.forge(params).destroy();
  }
};
