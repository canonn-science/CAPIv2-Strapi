'use strict';

/**
 * Lifecycle callbacks for the `Alert` model.
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
  afterCreate: async (model, attrs, options) => {
    const webhook = require("webhook-discord");

    const Hook = new webhook.Webhook(process.env.CHANNEL_RD);

    if(model.attributes.active === true) {
      const msg = new webhook.MessageBuilder()
        .setName('Gnosis Emergency Alert System')
        .setColor('#E74C3C')
        .addField(model.attributes.title + 'Alert Level: ' + model.attributes.alertLevel, model.attributes.body)
        .setTime();

      Hook.send(msg);
    }
  },

  // Before updating a value.
  // Fired before an `update` query.
  // beforeUpdate: async (model, attrs, options) => {},

  // After updating a value.
  // Fired after an `update` query.
  afterUpdate: async (model, attrs, options) => {
    const webhook = require("webhook-discord");

    const Hook = new webhook.Webhook(process.env.CHANNEL_RD);

    if(model.attributes.active === true) {
      const msg = new webhook.MessageBuilder()
        .setName('Gnosis Emergency Alert System')
        .setColor('#E74C3C')
        .addField(model.attributes.title + ' - Alert Level: ' + model.attributes.alertLevel, model.attributes.body)
        .setTime();

      Hook.send(msg);
    }
  },

  // Before destroying a value.
  // Fired before a `delete` query.
  // beforeDestroy: async (model, attrs, options) => {},

  // After destroying a value.
  // Fired after a `delete` query.
  // afterDestroy: async (model, attrs, options) => {}
};
