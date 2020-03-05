'use strict';

const { sanitizeEntity } = require('strapi-utils');

/**
 * Read the documentation (https://strapi.io/documentation/3.0.0-beta.x/guides/controllers.html#core-controllers)
 * to customize this controller
 */

module.exports = {
  /**
   * Retrieve all Auth Token records (only the users tokens).
   *
   * @return {Array}
   */

  async find(ctx) {
    let entities;

    if (ctx.state.user.id) {
      ctx.query.user = ctx.state.user.id;
    } else {
      return ctx.unauthorized();
    }


    if (ctx.query._q) {
      entities = await strapi.services.authtoken.search(ctx.query);
    } else {
      entities = await strapi.services.authtoken.find(ctx.query, ['user', 'user.role']);
    }

    return entities.map(entity =>
      sanitizeEntity(entity, { model: strapi.models.authtoken })
    );
  },

  /**
   * Retrieve an Auth Token record.
   *
   * @return {Object}
   */

  async findOne(ctx) {
    const entity = await strapi.services.authtoken.findOne(ctx.params, ['user', 'user.role']);

    if (entity) {
      if (ctx.state.user.id === entity.user.id) {
        return sanitizeEntity(entity, { model: strapi.models.authtoken });
      } else {
        return ctx.unauthorized();
      }
    } else {
      return ctx.notFound('This token doesn\'t exist');
    }
  },

  /**
   * Count user's Auth Token records.
   *
   * @return {Number}
   */

  count(ctx) {
    if (ctx.state.user.id) {
      ctx.query.user = ctx.state.user.id;
    } else {
      return ctx.unauthorized();
    }

    if (ctx.query._q) {
      return strapi.services.authtoken.countSearch(ctx.query);
    }
    return strapi.services.authtoken.count(ctx.query);
  },

  /**
   * Update an Auth Token record.
   *
   * @return {Object}
   */

  async update(ctx) {
    let preUpdate = await strapi.services.authtoken.findOne(ctx.params);

    if (preUpdate && ctx.state.user.id) {
      if (ctx.state.user.id === preUpdate.user.id) {
        if (ctx.request.body.user) {
          if (ctx.state.user.id !== ctx.request.body.user) {
            return ctx.unauthorized();
          }
        }
        let entity = await strapi.services.authtoken.update(
          ctx.params,
          ctx.request.body
        );

        return sanitizeEntity(entity, { model: strapi.models.authtoken });
      } else {
        return ctx.unauthorized();
      }
    } else {
      return ctx.notFound('This token doesn\'t exist');
    }
  },

  /**
   * delete a record.
   *
   * @return {Object}
   */

  async delete(ctx) {
    let preDelete = await strapi.services.authtoken.findOne(ctx.params);

    if (preDelete && ctx.state.user.id) {
      if (ctx.state.user.id === preDelete.user.id) {
        const entity = await strapi.services.authtoken.delete(ctx.params);
        return sanitizeEntity(entity, { model: strapi.models.authtoken });
      } else {
        return ctx.unauthorized();
      }
    } else {
      return ctx.notFound('This token doesn\'t exist');
    }
  },
};
