'use strict';

/**
 * Gsobeliskreport.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all gsobeliskreports.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('gsobeliskreport', params);
    // Select field to populate.
    const populate = Gsobeliskreport.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Gsobeliskreport.query(function(qb) {
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
   * Promise to fetch a/an gsobeliskreport.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Gsobeliskreport.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Gsobeliskreport.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an gsobeliskreport.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('gsobeliskreport', params);

    return Gsobeliskreport.query(function(qb) {
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
   * Promise to add a/an gsobeliskreport.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Gsobeliskreport.associations.map(ast => ast.alias));
    const data = _.omit(values, Gsobeliskreport.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Gsobeliskreport.forge(data).save();

    // Create relational data and return the entry.
    return Gsobeliskreport.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an gsobeliskreport.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Gsobeliskreport.associations.map(ast => ast.alias));
    const data = _.omit(values, Gsobeliskreport.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Gsobeliskreport.forge(params).save(data, { path: true });

    // Create relational data and return the entry.
    return Gsobeliskreport.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an gsobeliskreport.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    await Promise.all(
      Gsobeliskreport.associations.map(association =>
        Gsobeliskreport.forge(params)[association.alias]().detach()
      )
    );

    return Gsobeliskreport.forge(params).destroy();
  }
};
