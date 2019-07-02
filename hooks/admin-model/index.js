const _ = require('lodash');

module.exports = () => {
  return {
    initialize(cb) {
      _.merge(strapi.admin.models.administrator, {
        connection: 'users'
      });

      cb();
    },
  };
};
