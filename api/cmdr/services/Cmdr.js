/* global Cmdr */
'use strict';

/**
 * Cmdr.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-hook-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all cmdrs.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('cmdr', params);
    // Select field to populate.
    const populate = Cmdr.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Cmdr.query(function(qb) {
      _.forEach(filters.where, (where, key) => {
        if (_.isArray(where.value) && where.symbol !== 'IN' && where.symbol !== 'NOT IN') {
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
      withRelated: filters.populate || populate
    });
  },

  /**
   * Promise to fetch a/an cmdr.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Cmdr.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Cmdr.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an cmdr.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('cmdr', params);

    return Cmdr.query(function(qb) {
      _.forEach(filters.where, (where, key) => {
        if (_.isArray(where.value)) {
          for (const value in where.value) {
            qb[value ? 'where' : 'orWhere'](key, where.symbol, where.value[value]);
          }
        } else {
          qb.where(key, where.symbol, where.value);
        }
      });
    }).count();
  },

  /**
   * Promise to add a/an cmdr.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Cmdr.associations.map(ast => ast.alias));
    const data = _.omit(values, Cmdr.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Cmdr.forge(data).save();

    // Create relational data and return the entry.
    return Cmdr.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an cmdr.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Cmdr.associations.map(ast => ast.alias));
    const data = _.omit(values, Cmdr.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Cmdr.forge(params).save(data);

    // Create relational data and return the entry.
    return Cmdr.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an cmdr.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    params.values = {};
    Cmdr.associations.map(association => {
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

    await Cmdr.updateRelations(params);

    return Cmdr.forge(params).destroy();
  },

  /**
   * Promise to search a/an cmdr.
   *
   * @return {Promise}
   */

  search: async (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('cmdr', params);
    // Select field to populate.
    const populate = Cmdr.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const associations = Cmdr.associations.map(x => x.alias);
    const searchText = Object.keys(Cmdr._attributes)
      .filter(attribute => attribute !== Cmdr.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['string', 'text'].includes(Cmdr._attributes[attribute].type));

    const searchNoText = Object.keys(Cmdr._attributes)
      .filter(attribute => attribute !== Cmdr.primaryKey && !associations.includes(attribute))
      .filter(attribute => !['string', 'text', 'boolean', 'integer', 'decimal', 'float'].includes(Cmdr._attributes[attribute].type));

    const searchInt = Object.keys(Cmdr._attributes)
      .filter(attribute => attribute !== Cmdr.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['integer', 'decimal', 'float'].includes(Cmdr._attributes[attribute].type));

    const searchBool = Object.keys(Cmdr._attributes)
      .filter(attribute => attribute !== Cmdr.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['boolean'].includes(Cmdr._attributes[attribute].type));

    const query = (params._q || '').replace(/[^a-zA-Z0-9.-\s]+/g, '');

    return Cmdr.query(qb => {
      // Search in columns which are not text value.
      searchNoText.forEach(attribute => {
        qb.orWhereRaw(`LOWER(${attribute}) LIKE '%${_.toLower(query)}%'`);
      });

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
      switch (Cmdr.client) {
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
      width: populate
    });
  }
};
