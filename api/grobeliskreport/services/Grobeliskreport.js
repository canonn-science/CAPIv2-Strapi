'use strict';

/**
 * Grobeliskreport.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all grobeliskreports.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('grobeliskreport', params);
    // Select field to populate.
    const populate = Grobeliskreport.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Grobeliskreport.query(function(qb) {
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
   * Promise to fetch a/an grobeliskreport.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Grobeliskreport.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Grobeliskreport.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an grobeliskreport.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('grobeliskreport', params);

    return Grobeliskreport.query(function(qb) {
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
   * Promise to add a/an grobeliskreport.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Grobeliskreport.associations.map(ast => ast.alias));
    const data = _.omit(values, Grobeliskreport.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Grobeliskreport.forge(data).save();

    // Create relational data and return the entry.
    return Grobeliskreport.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an grobeliskreport.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Grobeliskreport.associations.map(ast => ast.alias));
    const data = _.omit(values, Grobeliskreport.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Grobeliskreport.forge(params).save(data, { path: true });

    // Create relational data and return the entry.
    return Grobeliskreport.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an grobeliskreport.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    await Promise.all(
      Grobeliskreport.associations.map(association =>
        Grobeliskreport.forge(params)[association.alias]().detach()
      )
    );

    return Grobeliskreport.forge(params).destroy();
  }
};
