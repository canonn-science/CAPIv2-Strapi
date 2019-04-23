/* global System */
'use strict';

/**
 * System.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-hook-bookshelf/lib/utils/');
const { convertRestQueryParams, buildQuery } = require('strapi-utils');


module.exports = {

  /**
   * Promise to fetch all systems.
   *
   * @return {Promise}
   */

  fetchAll: (params, populate) => {
    // Select field to populate.
    const withRelated = populate || System.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const filters = convertRestQueryParams(params);

    return System.query(buildQuery({ model: System, filters }))
      .fetchAll({ withRelated })
      .then(data => data.toJSON());
  },

  /**
   * Promise to fetch a/an system.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = System.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return System.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an system.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = convertRestQueryParams(params);

    return System.query(buildQuery({ model: System, filters: _.pick(filters, 'where') })).count();
  },

  /**
   * Promise to add a/an system.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, System.associations.map(ast => ast.alias));
    const data = _.omit(values, System.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await System.forge(data).save();

    // Create relational data and return the entry.
    return System.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an system.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, System.associations.map(ast => ast.alias));
    const data = _.omit(values, System.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await System.forge(params).save(data);

    // Create relational data and return the entry.
    return System.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an system.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    params.values = {};
    System.associations.map(association => {
      switch (association.nature) {
        case 'oneWay':
        case 'oneToOne':
        case 'manyToOne':
        case 'oneToManyMorph':
          params.values[association.alias] = null;
          break;
        case 'oneToMany':
        case 'manyToMany':
        case 'manyToManyMorph':
          params.values[association.alias] = [];
          break;
        default:
      }
    });

    await System.updateRelations(params);

    return System.forge(params).destroy();
  },

  /**
   * Promise to search a/an system.
   *
   * @return {Promise}
   */

  search: async (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('system', params);
    // Select field to populate.
    const populate = System.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const associations = System.associations.map(x => x.alias);
    const searchText = Object.keys(System._attributes)
      .filter(attribute => attribute !== System.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['string', 'text'].includes(System._attributes[attribute].type));

    const searchInt = Object.keys(System._attributes)
      .filter(attribute => attribute !== System.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['integer', 'decimal', 'float'].includes(System._attributes[attribute].type));

    const searchBool = Object.keys(System._attributes)
      .filter(attribute => attribute !== System.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['boolean'].includes(System._attributes[attribute].type));

    const query = (params._q || '').replace(/[^a-zA-Z0-9.-\s]+/g, '');

    return System.query(qb => {
      if (!_.isNaN(_.toNumber(query))) {
        searchInt.forEach(attribute => {
          qb.orWhereRaw(`${attribute} = ${_.toNumber(query)}`);
        });
      }

      if (query === 'true' || query === 'false') {
        searchBool.forEach(attribute => {
          qb.orWhereRaw(`${attribute} = ${_.toNumber(query === 'true')}`);
        });
      }

      // Search in columns with text using index.
      switch (System.client) {
        case 'mysql':
          qb.orWhereRaw(`MATCH(${searchText.join(',')}) AGAINST(? IN BOOLEAN MODE)`, `*${query}*`);
          break;
        case 'pg': {
          const searchQuery = searchText.map(attribute =>
            _.toLower(attribute) === attribute
              ? `to_tsvector(${attribute})`
              : `to_tsvector('${attribute}')`
          );

          qb.orWhereRaw(`${searchQuery.join(' || ')} @@ to_tsquery(?)`, query);
          break;
        }
      }

      if (filters.sort) {
        qb.orderBy(filters.sort.key, filters.sort.order);
      }

      if (filters.skip) {
        qb.offset(_.toNumber(filters.skip));
      }

      if (filters.limit) {
        qb.limit(_.toNumber(filters.limit));
      }
    }).fetchAll({
      withRelated: populate
    });
  }
};
