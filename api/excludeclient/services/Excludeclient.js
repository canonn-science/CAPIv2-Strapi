/* global Excludeclient */
'use strict';

/**
 * Excludeclient.js service
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
   * Promise to deny blocked clients on reports.
   *
   * @return {Promise}
   */

  blockClient: async (clientVersion) => {

    if (process.env.BLACKLIST_CLIENT == "true") {
      if (clientVersion == undefined) {

        const err = new Error(`You are missing a client version, please speak to your client author to ensure a client version is passed.`);
        err.status = 400;
        err.expose = false;
        throw err;

      }

      let clientVersionResult = await strapi.api.excludeclient.services.excludeclient.fetchAll({
        version: clientVersion
      })
      let clientVersionData = null

      if (clientVersionResult.models.length > 0) {

        clientVersionData = Object.setPrototypeOf(clientVersionResult.models[0].attributes, {})

      } else {

        clientVersionData = null

      }

      if (clientVersionData != null && clientVersionResult.models != undefined && clientVersionData.version == clientVersion) {

        const err = new Error(`Your Client: ${clientVersionData.version} is in our blacklist. You should update your client or talk to the author.`);
        err.status = 418;
        err.expose = false;
        throw err;

      }
    }
  },

  /**
   * Promise to fetch all excludeclients.
   *
   * @return {Promise}
   */

  fetchAll: (params, populate) => {
    // Select field to populate.
    const withRelated = populate || Excludeclient.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const filters = convertRestQueryParams(params);

    return Excludeclient.query(buildQuery({ model: Excludeclient, filters }))
      .fetchAll({ withRelated })
      .then(data => data.toJSON());
  },

  /**
   * Promise to fetch a/an excludeclient.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Excludeclient.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Excludeclient.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an excludeclient.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = convertRestQueryParams(params);

    return Excludeclient.query(buildQuery({ model: Excludeclient, filters: _.pick(filters, 'where') })).count();
  },

  /**
   * Promise to add a/an excludeclient.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Excludeclient.associations.map(ast => ast.alias));
    const data = _.omit(values, Excludeclient.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Excludeclient.forge(data).save();

    // Create relational data and return the entry.
    return Excludeclient.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an excludeclient.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Excludeclient.associations.map(ast => ast.alias));
    const data = _.omit(values, Excludeclient.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Excludeclient.forge(params).save(data);

    // Create relational data and return the entry.
    return Excludeclient.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an excludeclient.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    params.values = {};
    Excludeclient.associations.map(association => {
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

    await Excludeclient.updateRelations(params);

    return Excludeclient.forge(params).destroy();
  },

  /**
   * Promise to search a/an excludeclient.
   *
   * @return {Promise}
   */

  search: async (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('excludeclient', params);
    // Select field to populate.
    const populate = Excludeclient.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const associations = Excludeclient.associations.map(x => x.alias);
    const searchText = Object.keys(Excludeclient._attributes)
      .filter(attribute => attribute !== Excludeclient.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['string', 'text'].includes(Excludeclient._attributes[attribute].type));

    const searchInt = Object.keys(Excludeclient._attributes)
      .filter(attribute => attribute !== Excludeclient.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['integer', 'decimal', 'float'].includes(Excludeclient._attributes[attribute].type));

    const searchBool = Object.keys(Excludeclient._attributes)
      .filter(attribute => attribute !== Excludeclient.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['boolean'].includes(Excludeclient._attributes[attribute].type));

    const query = (params._q || '').replace(/[^a-zA-Z0-9.-\s]+/g, '');

    return Excludeclient.query(qb => {
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
      switch (Excludeclient.client) {
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
