'use strict';

/**
 * Ring.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all rings.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('ring', params);
    // Select field to populate.
    const populate = Ring.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Ring.query(function(qb) {
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
   * Promise to fetch a/an ring.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Ring.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Ring.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to add a/an ring.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Ring.associations.map(ast => ast.alias));
    const data = _.omit(values, Ring.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Ring.forge(data).save();

    // Create relational data and return the entry.
    return Ring.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an ring.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Ring.associations.map(ast => ast.alias));
    const data = _.omit(values, Ring.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Ring.forge(params).save(data, { path: true });

    // Create relational data and return the entry.
    return Ring.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an ring.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    await Promise.all(
      Ring.associations.map(association =>
        Ring.forge(params)[association.alias]().detach()
      )
    );

    return Ring.forge(params).destroy();
  }
};
