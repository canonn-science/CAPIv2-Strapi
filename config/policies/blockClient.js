module.exports = async (ctx, next) => {

  let clientVersion = ctx.request.body.clientVersion;

  if (process.env.BLACKLIST_CLIENT == 'true') {
    if (clientVersion == undefined) {
      return ctx.forbidden('You are missing a client version, please speak to your client author to ensure a client version is passed.');
    }

    let clientVersionQuery = await strapi.api.excludeclient.services.excludeclient.find({
      version: clientVersion
    });
    let clientVersionData = null;
    let clientVersionResult = clientVersionQuery;

    if (clientVersionResult[0] != undefined) {
      clientVersionData = clientVersionResult[0];
    } else {
      clientVersionData = null;
    }

    if (clientVersionData != null && clientVersionData != undefined && clientVersionData.version == clientVersion) {
      return ctx.forbidden(`Your Client: ${clientVersionData.version} is in our blacklist. You should update your client or talk to the author.`);
    }
  }
  return await next();
};
