var PythonShell = require('python-shell');

'use strict';

/**
 * Lifecycle callbacks for the `Tgencounterstat` model.
 */

module.exports = {
  // Before saving a value.
  // Fired before an `insert` or `update` query.
  // beforeSave: async (model, attrs, options) => {},

  // After saving a value.
  // Fired after an `insert` or `update` query.
  // afterSave: async (model, response, options) => {},

  // Before fetching a value.
  // Fired before a `fetch` operation.
  // beforeFetch: async (model, columns, options) => {},

  // After fetching a value.
  // Fired after a `fetch` operation.
  // afterFetch: async (model, response, options) => {},

  // Before creating a value.
  // Fired before an `insert` query.
  // beforeCreate: async (model, attrs, options) => {},

  // After creating a value.
  // Fired after an `insert` query.
  // afterCreate: async (model, attrs, options) => {},
  afterCreate: async (model, attrs, options) => {
    var options = {
      mode: 'text',
      pythonPath: '/usr/bin/python3',
      pythonOptions: ['-u'],
      scriptPath: 'config/functions/',
      args: ['--' + strapi.config.currentEnvironment.environment, '-system' , model.attributes["hyperdictionSystemName"] ]
    };
    PythonShell.run('tgencounterstats_insert.py', options, function (err, results) {
      if (err) throw err;
      // results is an array consisting of messages collected during execution
      for (var i in results) {
	console.log(results[i]);
      }
    });
  }

  // Before updating a value.
  // Fired before an `update` query.
  // beforeUpdate: async (model, attrs, options) => {},

  // After updating a value.
  // Fired after an `update` query.
  // afterUpdate: async (model, attrs, options) => {},

  // Before destroying a value.
  // Fired before a `delete` query.
  // beforeDestroy: async (model, attrs, options) => {},

  // After destroying a value.
  // Fired after a `delete` query.
  // afterDestroy: async (model, attrs, options) => {}
};
