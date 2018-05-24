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
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('location', params);
    // Select field to populate.
    const populate = Location.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Location.query(function(qb) {
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
   * Promise to fetch a/an location.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Location.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Location.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to add a/an location.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Location.associations.map(ast => ast.alias));
    const data = _.omit(values, Location.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Location.forge(data).save();

    // Create relational data and return the entry.
    return Location.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an location.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Location.associations.map(ast => ast.alias));
    const data = _.omit(values, Location.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Location.forge(params).save(data, { path: true });

    // Create relational data and return the entry.
    return Location.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an location.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    await Promise.all(
      Location.associations.map(association =>
        Location.forge(params)[association.alias]().detach()
      )
    );

    return Location.forge(params).destroy();
  }
};
