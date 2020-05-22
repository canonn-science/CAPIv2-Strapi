module.exports = async (ctx, next) => {

  let eventName = ctx.request.body.eventName;
  let eventNameCleaned = eventName.toLowerCase();

  if (process.env.BLACKLIST_EVENT == 'true') {
    if (eventName == undefined) {
      return ctx.badRequest('You are missing a event name, please speak to your client author to ensure a event name is passed.');
    }

    let eventNameQuery = await strapi.api.excludeevent.services.excludeevent.find({
      eventName: eventNameCleaned
    });
    let eventNameData = null;
    let eventNameResult = eventNameQuery;

    if (eventNameResult[0] != undefined) {
      eventNameData = eventNameResult[0];
    } else {
      eventNameData = null;
    }

    if (eventNameData != null && eventNameData != undefined && eventNameData.eventName.toLowerCase() == eventNameCleaned) {
      return ctx.badRequest(`The Event Name: ${eventName} is in our blacklist. You should update your client or talk to the author.`);
    }
  }

  return await next();
};
