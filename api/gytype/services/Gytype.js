/* global Gytype */
'use strict';

/**
 * Gytype.js service
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
   * Promise to fetch all gytypes.
   *
   * @return {Promise}
   */

  fetchAll: (params, populate) => {
    // Select field to populate.
    const withRelated = populate || Gytype.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const filters = convertRestQueryParams(params);

    return Gytype.query(buildQuery({ model: Gytype, filters }))
      .fetchAll({ withRelated })
      .then(data => data.toJSON());
  },

  /**
   * Promise to fetch a/an gytype.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Gytype.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Gytype.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an gytype.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = convertRestQueryParams(params);

    return Gytype.query(buildQuery({ model: Gytype, filters: _.pick(filters, 'where') })).count();
  },

  /**
   * Promise to add a/an gytype.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Gytype.associations.map(ast => ast.alias));
    const data = _.omit(values, Gytype.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Gytype.forge(data).save();

    // Create relational data and return the entry.
    return Gytype.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an gytype.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Gytype.associations.map(ast => ast.alias));
    const data = _.omit(values, Gytype.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Gytype.forge(params).save(data);

    // Create relational data and return the entry.
    return Gytype.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an gytype.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    params.values = {};
    Gytype.associations.map(association => {
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

    await Gytype.updateRelations(params);

    return Gytype.forge(params).destroy();
  },

  /**
   * Promise to search a/an gytype.
   *
   * @return {Promise}
   */

  search: async (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('gytype', params);
    // Select field to populate.
    const populate = Gytype.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const associations = Gytype.associations.map(x => x.alias);
    const searchText = Object.keys(Gytype._attributes)
      .filter(attribute => attribute !== Gytype.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['string', 'text'].includes(Gytype._attributes[attribute].type));

    const searchInt = Object.keys(Gytype._attributes)
      .filter(attribute => attribute !== Gytype.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['integer', 'decimal', 'float'].includes(Gytype._attributes[attribute].type));

    const searchBool = Object.keys(Gytype._attributes)
      .filter(attribute => attribute !== Gytype.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['boolean'].includes(Gytype._attributes[attribute].type));

    const query = (params._q || '').replace(/[^a-zA-Z0-9.-\s]+/g, '');

    return Gytype.query(qb => {
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
      switch (Gytype.client) {
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
