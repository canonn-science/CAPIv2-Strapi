'use strict';

/**
 * Gscodexdata.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all gscodexdata.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('gscodexdata', params);
    // Select field to populate.
    const populate = Gscodexdata.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Gscodexdata.query(function(qb) {
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
   * Promise to fetch a/an gscodexdata.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Gscodexdata.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Gscodexdata.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an gscodexdata.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('gscodexdata', params);

    return Gscodexdata.query(function(qb) {
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
   * Promise to add a/an gscodexdata.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Gscodexdata.associations.map(ast => ast.alias));
    const data = _.omit(values, Gscodexdata.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Gscodexdata.forge(data).save();

    // Create relational data and return the entry.
    return Gscodexdata.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an gscodexdata.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Gscodexdata.associations.map(ast => ast.alias));
    const data = _.omit(values, Gscodexdata.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Gscodexdata.forge(params).save(data, { path: true });

    // Create relational data and return the entry.
    return Gscodexdata.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an gscodexdata.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    await Promise.all(
      Gscodexdata.associations.map(association =>
        Gscodexdata.forge(params)[association.alias]().detach()
      )
    );

    return Gscodexdata.forge(params).destroy();
  }
};
