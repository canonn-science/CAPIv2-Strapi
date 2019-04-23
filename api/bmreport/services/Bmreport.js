/* global Bmreport */
'use strict';

/**
 * Bmreport.js service
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
   * Promise to fetch all bmreports.
   *
   * @return {Promise}
   */

  fetchAll: (params, populate) => {
    // Select field to populate.
    const withRelated = populate || Bmreport.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const filters = convertRestQueryParams(params);

    return Bmreport.query(buildQuery({ model: Bmreport, filters }))
      .fetchAll({ withRelated })
      .then(data => data.toJSON());
  },

  /**
   * Promise to fetch a/an bmreport.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Bmreport.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Bmreport.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an bmreport.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = convertRestQueryParams(params);

    return Bmreport.query(buildQuery({ model: Bmreport, filters: _.pick(filters, 'where') })).count();
  },

  /**
   * Promise to add a/an bmreport.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Bmreport.associations.map(ast => ast.alias));
    const data = _.omit(values, Bmreport.associations.map(ast => ast.alias));

    // Check blacklists (Client & CMDR)
    await strapi.api.excludeclient.services.excludeclient.blockClient(data.clientVersion);
    await strapi.api.excludecmdr.services.excludecmdr.blockCMDR(data.cmdrName);

    // Create entry with no-relational data.
    const entry = await Bmreport.forge(data).save();

    // Create relational data and return the entry.
    return Bmreport.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an bmreport.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Bmreport.associations.map(ast => ast.alias));
    const data = _.omit(values, Bmreport.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Bmreport.forge(params).save(data);

    // Create relational data and return the entry.
    return Bmreport.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an bmreport.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    params.values = {};
    Bmreport.associations.map(association => {
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

    await Bmreport.updateRelations(params);

    return Bmreport.forge(params).destroy();
  },

  /**
   * Promise to search a/an bmreport.
   *
   * @return {Promise}
   */

  search: async (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('bmreport', params);
    // Select field to populate.
    const populate = Bmreport.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const associations = Bmreport.associations.map(x => x.alias);
    const searchText = Object.keys(Bmreport._attributes)
      .filter(attribute => attribute !== Bmreport.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['string', 'text'].includes(Bmreport._attributes[attribute].type));

    const searchInt = Object.keys(Bmreport._attributes)
      .filter(attribute => attribute !== Bmreport.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['integer', 'decimal', 'float'].includes(Bmreport._attributes[attribute].type));

    const searchBool = Object.keys(Bmreport._attributes)
      .filter(attribute => attribute !== Bmreport.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['boolean'].includes(Bmreport._attributes[attribute].type));

    const query = (params._q || '').replace(/[^a-zA-Z0-9.-\s]+/g, '');

    return Bmreport.query(qb => {
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
      switch (Bmreport.client) {
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
