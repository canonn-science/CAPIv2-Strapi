module.exports = async (ctx, next) => {
  // Example: $ListeningPost:#index=1;
  function cleanName(name) {
    let unclean = name.toLowerCase();
    let cleaned = unclean.replace(/[$]|:#index=[0-9]*|_title|;/gi, '');

    return cleaned;
  }

  let signalName = ctx.request.body.signalName;
  let signalNameCleaned = cleanName(signalName);

  if (process.env.BLACKLIST_FSS == 'true') {
    if (signalName == undefined) {
      return ctx.badRequest(
        'You are missing an FSS signal name, please speak to your client author to ensure an FSS signal name is passed.'
      );
    }

    let query = await strapi.query('excludefss').find({
      fssName_contains: signalNameCleaned,
    });
    let signalNameData;
    let result = query;

    if (result[0] != undefined) {
      signalNameData = result[0];
    } else {
      signalNameData = undefined;
    }

    if (signalNameData && cleanName(signalNameData.fssName) == signalNameCleaned) {
      return ctx.badRequest(
        `The FSS Signal Name: ${signalName} is in our blacklist. You should update your client or talk to the author.`
      );
    }
  }

  await next();
};
