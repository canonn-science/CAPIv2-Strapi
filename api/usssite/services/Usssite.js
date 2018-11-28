'use strict';
/* global Usssite */

/**
 * Usssite.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

module.exports = {

  /**
   * Promise to fetch all usssites.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Get model hook
    const hook = strapi.hook[Usssite.orm];
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('usssite', params);
    // Select field to populate.
    const populate = Usssite.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Usssite.query(function(qb) {
      // Generate match stage.
      hook.load().generateMatchStage(qb)(Usssite, filters);

      if (_.has(filters, 'start')) qb.offset(filters.start);
      if (_.has(filters, 'limit')) qb.limit(filters.limit);
      if (!_.isEmpty(filters.sort)) {
        if (filters.sort.key) {
          qb.orderBy(filters.sort.key, filters.sort.order);
        } else {
          qb.orderBy(filters.sort);
        }
      }
    }).fetchAll({
      withRelated: populate
    });
  },

  /**
   * Promise to fetch a/an usssite.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Usssite.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Usssite.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an usssite.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('usssite', params);

    return Usssite.query(function(qb) {
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
   * Promise to add a/an usssite.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Usssite.associations.map(ast => ast.alias));
    const data = _.omit(values, Usssite.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Usssite.forge(data).save();

    // Create relational data and return the entry.
    return Usssite.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an usssite.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Usssite.associations.map(ast => ast.alias));
    const data = _.omit(values, Usssite.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Usssite.forge(params).save(data);

    // Create relational data and return the entry.
    return Usssite.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an usssite.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    params.values = {};
    Usssite.associations.map(association => {
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

    await Usssite.updateRelations(params);

    return Usssite.forge(params).destroy();
  },

  /**
   * Promise to search a/an usssite.
   *
   * @return {Promise}
   */

  search: async (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('usssite', params);
    // Select field to populate.
    const populate = Usssite.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const associations = Usssite.associations.map(x => x.alias);
    const searchText = Object.keys(Usssite._attributes)
      .filter(attribute => attribute !== Usssite.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['string', 'text'].includes(Usssite._attributes[attribute].type));

    const searchNoText = Object.keys(Usssite._attributes)
      .filter(attribute => attribute !== Usssite.primaryKey && !associations.includes(attribute))
      .filter(attribute => !['string', 'text', 'boolean', 'integer', 'decimal', 'float'].includes(Usssite._attributes[attribute].type));

    const searchInt = Object.keys(Usssite._attributes)
      .filter(attribute => attribute !== Usssite.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['integer', 'decimal', 'float'].includes(Usssite._attributes[attribute].type));

    const searchBool = Object.keys(Usssite._attributes)
      .filter(attribute => attribute !== Usssite.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['boolean'].includes(Usssite._attributes[attribute].type));

    const query = (params._q || '').replace(/[^a-zA-Z0-9.-\s]+/g, '');

    return Usssite.query(qb => {
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
      switch (Usssite.client) {
        case 'pg': {
          const searchQuery = searchText.map(attribute =>
            _.toLower(attribute) === attribute
              ? `to_tsvector(${attribute})`
              : `to_tsvector('${attribute}')`
          );

          qb.orWhereRaw(`${searchQuery.join(' || ')} @@ to_tsquery(?)`, query);
          break;
        }
        default:
          qb.orWhereRaw(`MATCH(${searchText.join(',')}) AGAINST(? IN BOOLEAN MODE)`, `*${query}*`);
          break;
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
