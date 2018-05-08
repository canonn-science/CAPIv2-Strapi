'use strict';

/**
 * Body.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all bodies.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('body', params);
    // Select field to populate.
    const populate = Body.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Body.query(function(qb) {
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
   * Promise to fetch a/an body.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Body.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Body.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to add a/an body.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Body.associations.map(ast => ast.alias));
    const data = _.omit(values, Body.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Body.forge(data).save();

    // Create relational data and return the entry.
    return Body.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an body.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Body.associations.map(ast => ast.alias));
    const data = _.omit(values, Body.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Body.forge(params).save(data, { path: true });

    // Create relational data and return the entry.
    return Body.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an body.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    await Promise.all(
      Body.associations.map(association =>
        Body.forge(params)[association.alias]().detach()
      )
    );

    return Body.forge(params).destroy();
  }
};
