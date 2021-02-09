module.exports = async (ctx, next) => {
  let clientVersion = ctx.request.body.clientVersion;

  if (process.env.BLACKLIST_CLIENT == 'true') {
    if (clientVersion == undefined) {
      return ctx.forbidden(
        'You are missing a client version, please speak to your client author to ensure a client version is passed.'
      );
    }

    let query = await strapi.query('excludeclient').find({
      version: clientVersion,
    });
    let clientVersionData;
    let result = query;

    if (result[0] != undefined) {
      clientVersionData = result[0];
    } else {
      clientVersionData = undefined;
    }

    if (clientVersionData && clientVersionData.version == clientVersion) {
      return ctx.forbidden(
        `Your Client: ${clientVersionData.version} is in our blacklist. You should update your client or talk to the author.`
      );
    }
  }
  await next();
};
