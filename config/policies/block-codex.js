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
      return ctx.badRequest('You are missing a codex name, please speak to your client author to ensure a codex name is passed.');
    }

    let codexNameQuery = await strapi.api.excludecodex.services.excludecodex.find({
      codexName: codexNameCleaned
    });
    let codexNameData = null;
    let codexNameResult = codexNameQuery;

    if (codexNameResult[0] != undefined) {
      codexNameData = codexNameResult[0];
    } else {
      codexNameData = null;
    }

    if (codexNameData != null && codexNameData != undefined && codexNameData.codexName == codexNameCleaned) {
      return ctx.badRequest(`The Codex Name: ${codexName} is in our blacklist. You should update your client or talk to the author.`);
    }
  }

  return await next();
};
