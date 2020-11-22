module.exports = async (ctx, next) => {
  let eventName = ctx.request.body.eventName;
  let eventNameCleaned = eventName.toLowerCase();

  if (process.env.BLACKLIST_EVENT == 'true') {
    if (eventName == undefined) {
      return ctx.badRequest(
        'You are missing a event name, please speak to your client author to ensure a event name is passed.'
      );
    }

    let query = await strapi.query('excludeevent').find({
      eventName: eventNameCleaned,
    });
    let eventNameData;
    let result = query;

    if (result[0] != undefined) {
      eventNameData = result[0];
    } else {
      eventNameData = undefined;
    }

    if (eventNameData && eventNameData.eventName.toLowerCase() == eventNameCleaned) {
      return ctx.badRequest(
        `The Event Name: ${eventName} is in our blacklist. You should update your client or talk to the author.`
      );
    }
  }

  await next();
};
