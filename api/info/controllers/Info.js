'use strict';

/**
 * Info.js controller
 *
 * @description: A set of functions called "actions" for managing `Info`.
 */

module.exports = {

  /**
   * Retrieve app configs.
   *
   * @return {Object}
   */

  info: (ctx) => {
    ctx.send({
      proxyEnabled: strapi.config.proxy.enabled,
      proxyHost: strapi.config.proxy.host,
      proxySSLEnabled: strapi.config.proxy.ssl,
      proxySSLPort: strapi.config.proxy.port
    });
  },

  version: (ctx) => {
    ctx.send({
      version: strapi.config.version
    });
  }
};
