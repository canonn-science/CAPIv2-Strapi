'use strict';

/**
 * Grcodexcategories.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all grcodexcategories.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('grcodexcategories', params);
    // Select field to populate.
    const populate = Grcodexcategories.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Grcodexcategories.query(function(qb) {
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
   * Promise to fetch a/an grcodexcategories.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Grcodexcategories.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Grcodexcategories.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an grcodexcategories.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('grcodexcategories', params);

    return Grcodexcategories.query(function(qb) {
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
   * Promise to add a/an grcodexcategories.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Grcodexcategories.associations.map(ast => ast.alias));
    const data = _.omit(values, Grcodexcategories.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Grcodexcategories.forge(data).save();

    // Create relational data and return the entry.
    return Grcodexcategories.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an grcodexcategories.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Grcodexcategories.associations.map(ast => ast.alias));
    const data = _.omit(values, Grcodexcategories.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Grcodexcategories.forge(params).save(data, { path: true });

    // Create relational data and return the entry.
    return Grcodexcategories.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an grcodexcategories.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    await Promise.all(
      Grcodexcategories.associations.map(association =>
        Grcodexcategories.forge(params)[association.alias]().detach()
      )
    );

    return Grcodexcategories.forge(params).destroy();
  }
};
