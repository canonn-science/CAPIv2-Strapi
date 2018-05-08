const _ = require('lodash');

module.exports = {
  find: async function (params, populate) {
    return this.query(function(qb) {
      _.forEach(params.where, (where, key) => {
        if (_.isArray(where.value)) {
          for (const value in where.value) {
            qb[value ? 'where' : 'orWhere'](key, where.symbol, where.value[value]);
          }
        } else {
          qb.where(key, where.symbol, where.value);
        }
      });

      if (params.sort) {
        qb.orderBy(params.sort);
      }

      if (params.skip) {
        qb.offset(_.toNumber(params.skip));
      }

      if (params.limit) {
        qb.limit(_.toNumber(params.limit));
      }
    }).fetchAll({
      withRelated: populate || this.associations.map(x => x.alias)
    });
  },

  count: async function () {
    return await this
      .forge()
      .count();
  },

  findOne: async function (params, populate) {
    const record = await this
      .forge({
        [this.primaryKey]: params[this.primaryKey]
      })
      .fetch({
        withRelated: populate || this.associations.map(x => x.alias)
      });

    const data = record ? record.toJSON() : record;

    // Retrieve data manually.
    if (_.isEmpty(populate)) {
      const arrayOfPromises = this.associations
        .filter(association => ['manyMorphToOne', 'manyMorphToMany'].includes(association.nature))
        .map(association => { // eslint-disable-line no-unused-vars
          return this.morph.forge()
            .where({
              [`${this.collectionName}_id`]: params[this.primaryKey]
            })
            .fetchAll();
        });

      const related = await Promise.all(arrayOfPromises);

      related.forEach((value, index) => {
        data[this.associations[index].alias] = value ? value.toJSON() : value;
      });
    }

    return data;
  },

  create: async function (params) {
    // Exclude relationships.
    const values = Object.keys(params.values).reduce((acc, current) => {
      if (this._attributes[current] && this._attributes[current].type) {
        acc[current] = params.values[current];
      }

      return acc;
    }, {});

    const request = await this
      .forge(values)
      .save()
      .catch((err) => {
        if (err.detail) {
          const field = _.last(_.words(err.detail.split('=')[0]));
          err = { message: `This ${field} is already taken`, field };
        }

        throw err;
      });

    const entry = request.toJSON ? request.toJSON() : request;

    const relations = this.associations.reduce((acc, association) => {
      acc[association.alias] = params.values[association.alias];
      return acc;
    }, {});

    return module.exports.update.call(this, {
      [this.primaryKey]: entry[this.primaryKey],
      values: _.assign({
        id: entry[this.primaryKey]
      }, relations)
    });
  },

  update: async function (params) {
    // Call the business logic located in the hook.
    // This function updates no-relational and relational data.
    return this.updateRelations(params);
  },

  delete: async function (params) {
    return await this
      .forge({
        [this.primaryKey]: params.id
      })
      .destroy();
  }
};
