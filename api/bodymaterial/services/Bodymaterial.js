'use strict';

/**
 * Bodymaterial.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-bookshelf/lib/utils/');

module.exports = {

  /**
   * Promise to fetch all bodymaterials.
   *
   * @return {Promise}
   */

  fetchAll: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('bodymaterial', params);
    // Select field to populate.
    const populate = Bodymaterial.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Bodymaterial.query(function(qb) {
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
   * Promise to fetch a/an bodymaterial.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Bodymaterial.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Bodymaterial.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an bodymaterial.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('bodymaterial', params);

    return Bodymaterial.query(function(qb) {
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
   * Promise to add a/an bodymaterial.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Bodymaterial.associations.map(ast => ast.alias));
    const data = _.omit(values, Bodymaterial.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Bodymaterial.forge(data).save();

    // Create relational data and return the entry.
    return Bodymaterial.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an bodymaterial.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Bodymaterial.associations.map(ast => ast.alias));
    const data = _.omit(values, Bodymaterial.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = Bodymaterial.forge(params).save(data, { path: true });

    // Create relational data and return the entry.
    return Bodymaterial.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an bodymaterial.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    await Promise.all(
      Bodymaterial.associations.map(association =>
        Bodymaterial.forge(params)[association.alias]().detach()
      )
    );

    return Bodymaterial.forge(params).destroy();
  }
};
