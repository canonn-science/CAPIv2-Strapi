module.exports = async (ctx, next) => {
  function cleanName(name) {
    let unclean = name.toLowerCase();
    let cleaned = unclean.replace(/[$]|_name|;/gi, '');

    return cleaned;
  }

  let codexName = ctx.request.body.codexName;
  let codexNameCleaned = cleanName(codexName);

  if (process.env.BLACKLIST_CODEX == 'true') {
    if (codexName == undefined) {
      return ctx.badRequest(
        'You are missing a codex name, please speak to your client author to ensure a codex name is passed.'
      );
    }

    let query = await strapi.query('excludecodex').find({
      codexName: codexNameCleaned,
    });
    let codexNameData;
    let result = query;

    if (result[0] != undefined) {
      codexNameData = result[0];
    } else {
      codexNameData = undefined;
    }

    if (codexNameData && codexNameData.codexName == codexNameCleaned) {
      return ctx.badRequest(
        `The Codex Name: ${codexName} is in our blacklist. You should update your client or talk to the author.`
      );
    }
  }

  await next();
};
