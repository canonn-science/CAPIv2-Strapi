const _ = require('lodash');

module.exports = () => {
  return {
    async initialize() {
      await _.merge(strapi.admin.models.administrator, {
        connection: 'users'
      });
    },
  };
};
