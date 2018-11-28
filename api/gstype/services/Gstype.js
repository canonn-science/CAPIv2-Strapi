'use strict';
/* global Gstype */

/**
 * Gstype.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

module.exports = {

  /**
   * Promise to fetch all gstypes.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Get model hook
    const hook = strapi.hook[Gstype.orm];
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('gstype', params);
    // Select field to populate.
    const populate = Gstype.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Gstype.query(function(qb) {
      // Generate match stage.
      hook.load().generateMatchStage(qb)(Gstype, filters);

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
   * Promise to fetch a/an gstype.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Gstype.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Gstype.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an gstype.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('gstype', params);

    return Gstype.query(function(qb) {
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
   * Promise to add a/an gstype.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Gstype.associations.map(ast => ast.alias));
    const data = _.omit(values, Gstype.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Gstype.forge(data).save();

    // Create relational data and return the entry.
    return Gstype.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an gstype.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Gstype.associations.map(ast => ast.alias));
    const data = _.omit(values, Gstype.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Gstype.forge(params).save(data);

    // Create relational data and return the entry.
    return Gstype.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an gstype.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    params.values = {};
    Gstype.associations.map(association => {
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

    await Gstype.updateRelations(params);

    return Gstype.forge(params).destroy();
  },

  /**
   * Promise to search a/an gstype.
   *
   * @return {Promise}
   */

  search: async (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('gstype', params);
    // Select field to populate.
    const populate = Gstype.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const associations = Gstype.associations.map(x => x.alias);
    const searchText = Object.keys(Gstype._attributes)
      .filter(attribute => attribute !== Gstype.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['string', 'text'].includes(Gstype._attributes[attribute].type));

    const searchNoText = Object.keys(Gstype._attributes)
      .filter(attribute => attribute !== Gstype.primaryKey && !associations.includes(attribute))
      .filter(attribute => !['string', 'text', 'boolean', 'integer', 'decimal', 'float'].includes(Gstype._attributes[attribute].type));

    const searchInt = Object.keys(Gstype._attributes)
      .filter(attribute => attribute !== Gstype.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['integer', 'decimal', 'float'].includes(Gstype._attributes[attribute].type));

    const searchBool = Object.keys(Gstype._attributes)
      .filter(attribute => attribute !== Gstype.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['boolean'].includes(Gstype._attributes[attribute].type));

    const query = (params._q || '').replace(/[^a-zA-Z0-9.-\s]+/g, '');

    return Gstype.query(qb => {
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
      switch (Gstype.client) {
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
