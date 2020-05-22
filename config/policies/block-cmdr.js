module.exports = async (ctx, next) => {
  let cmdrName = ctx.request.body.cmdrName;

  if (process.env.BLACKLIST_CMDR == 'true') {
    if (cmdrName == undefined) {
      return ctx.forbidden('You are missing a CMDR Name, anonymous reporting is supported.');
    }

    let cmdrQuery = await strapi.api.excludecmdr.services.excludecmdr.find({
      cmdrName: cmdrName
    });
    let cmdrData = null;
    let cmdrResult = cmdrQuery;

    if (cmdrResult[0] != undefined) {
      cmdrData = cmdrResult[0];
    } else {
      cmdrData = null;
    }

    if (cmdrData != null && cmdrData != undefined && cmdrData.cmdrName == cmdrName) {
      return ctx.forbidden(`Your CMDR: ${cmdrData.cmdrName} is in our blacklist. This is due to your CMDR being flagged for abuse.`);
    }
  }
  return await next();
};
