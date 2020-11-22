module.exports = async (ctx, next) => {
  let cmdrName = ctx.request.body.cmdrName;

  if (process.env.BLACKLIST_CMDR == 'true') {
    if (cmdrName == undefined) {
      return ctx.forbidden('You are missing a CMDR Name, anonymous reporting is supported.');
    }

    let query = await strapi.query('excludecmdr').find({
      cmdrName: cmdrName,
    });
    let cmdrData;
    let result = query;

    if (result[0] != undefined) {
      cmdrData = result[0];
    } else {
      cmdrData = undefined;
    }

    if (cmdrData && cmdrData.cmdrName == cmdrName) {
      return ctx.forbidden(
        `Your CMDR: ${cmdrData.cmdrName} is in our blacklist. This is due to your CMDR being flagged for abuse.`
      );
    }
  }
  await next();
};
