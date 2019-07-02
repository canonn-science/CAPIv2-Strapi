/* global Reporttype */
'use strict';

/**
 * Reporttype.js service
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
   * Promise to fetch all reporttypes.
   *
   * @return {Promise}
   */

  fetchAll: (params, populate) => {
    // Select field to populate.
    const withRelated = populate || Reporttype.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const filters = convertRestQueryParams(params);

    return Reporttype.query(buildQuery({ model: Reporttype, filters }))
      .fetchAll({ withRelated })
      .then(data => data.toJSON());
  },

  /**
   * Promise to fetch a/an reporttype.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Reporttype.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Reporttype.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an reporttype.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = convertRestQueryParams(params);

    return Reporttype.query(buildQuery({ model: Reporttype, filters: _.pick(filters, 'where') })).count();
  },

  /**
   * Promise to add a/an reporttype.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Reporttype.associations.map(ast => ast.alias));
    const data = _.omit(values, Reporttype.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Reporttype.forge(data).save();

    // Create relational data and return the entry.
    return Reporttype.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an reporttype.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Reporttype.associations.map(ast => ast.alias));
    const data = _.omit(values, Reporttype.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Reporttype.forge(params).save(data);

    // Create relational data and return the entry.
    return Reporttype.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an reporttype.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    params.values = {};
    Reporttype.associations.map(association => {
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

    await Reporttype.updateRelations(params);

    return Reporttype.forge(params).destroy();
  },

  /**
   * Promise to search a/an reporttype.
   *
   * @return {Promise}
   */

  search: async (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('reporttype', params);
    // Select field to populate.
    const populate = Reporttype.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const associations = Reporttype.associations.map(x => x.alias);
    const searchText = Object.keys(Reporttype._attributes)
      .filter(attribute => attribute !== Reporttype.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['string', 'text'].includes(Reporttype._attributes[attribute].type));

    const searchInt = Object.keys(Reporttype._attributes)
      .filter(attribute => attribute !== Reporttype.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['integer', 'decimal', 'float'].includes(Reporttype._attributes[attribute].type));

    const searchBool = Object.keys(Reporttype._attributes)
      .filter(attribute => attribute !== Reporttype.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['boolean'].includes(Reporttype._attributes[attribute].type));

    const query = (params._q || '').replace(/[^a-zA-Z0-9.-\s]+/g, '');

    return Reporttype.query(qb => {
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
      switch (Reporttype.client) {
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
