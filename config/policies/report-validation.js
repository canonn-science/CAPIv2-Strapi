module.exports = async (ctx, next) => {
  let model = ctx.request.route.controller;
  let reportModel = strapi.models[model].allAttributes;
  let values = ctx.request.body;

  // Check userType has a value and is in the enum
  // ["console", "pc"]
  if (reportModel.userType != undefined) {
    if (reportModel.userType.required == true) {
      if (values.userType == undefined) {
        return ctx.badRequest(
          'You are missing a userType, this value should be either "pc" or "console".'
        );
      } else if (reportModel.userType.enum.includes(values.userType) == false) {
        return ctx.badRequest(
          `The userType: "${values.userType}" you sent is not a valid one, your options are either "pc" or "console".`
        );
      }
    }
  }

  // Check reportType has a value and is in the enum
  // ["new", "update", "error"]
  if (reportModel.reportType != undefined) {
    if (reportModel.reportType.required == true) {
      if (values.reportType == undefined) {
        return ctx.badRequest(
          'You are missing a reportType, this value should be "new", "update", or "error".'
        );
      } else if (reportModel.reportType.enum.includes(values.reportType) == false) {
        return ctx.badRequest(
          `The reportType: "${values.reportType}" you sent is not a valid one, your options are "new", "update", or "error".`
        );
      }
    }
  }

  // Check systemName has a value
  if (reportModel.systemName != undefined) {
    if (values.systemName == undefined) {
      return ctx.badRequest(
        'You are missing a systemName, the system is required and should exist in EDSM.'
      );
    }
  } else if (reportModel.system != undefined) {
    if (values.system == undefined) {
      return ctx.badRequest(
        'You are missing a system, the system is required and should exist in EDSM.'
      );
    }
  }

  // Check bodyName has a value if required
  if (reportModel.bodyName != undefined) {
    if (reportModel.bodyName.required == true) {
      if (values.bodyName == undefined) {
        return ctx.badRequest(
          'You are missing a bodyName, the body is required and should exist in EDSM.'
        );
      }
    }
  }

  // Check latitude has a value if required that is between -90 & 90
  if (reportModel.latitude != undefined) {
    if (reportModel.latitude.required == true) {
      if (values.latitude == undefined) {
        return ctx.badRequest(
          'You are missing a latitude value, this is a body POI which requires latitude/longitude.'
        );
      } else if (values.latitude < -90 || values.latitude > 90) {
        return ctx.badRequest('Your latitude value falls outside the possible range of -90 to 90.');
      }
    }
  }

  // Check longitude has a value if required that is between -180 & 180
  if (reportModel.latitude != undefined) {
    if (reportModel.longitude.required == true) {
      if (values.longitude == undefined) {
        return ctx.badRequest(
          'You are missing a longitude value, this is a body POI which requires longitude/longitude.'
        );
      } else if (values.longitude < -180 || values.longitude > 180) {
        return ctx.badRequest(
          'Your longitude value falls outside the possible range of -180 to 180.'
        );
      }
    }
  }

  // Check reportStatus has a value and is in the enum
  // ["pending", "updated", "verified", "accepted", "declined", "issue", "duplicate"]
  if (reportModel.reportStatus != undefined) {
    if (reportModel.reportStatus.required == true) {
      if (values.reportStatus == undefined) {
        return ctx.badRequest(
          'You are missing a reportStatus, this value should be "pending" for any user besides Canonn personnel.'
        );
      } else if (reportModel.reportStatus.enum.includes(values.reportStatus) == false) {
        return ctx.badRequest(
          `The reportStatus: "${values.reportStatus}" you sent is not a valid one, this value should be "pending" for any user besides Canonn personnel.`
        );
      }
    }
  }

  // Check material reports for a proper response to collectedFrom
  // ["missionReward", "collected", "scanned"]
  if (reportModel.collectedFrom != undefined) {
    if (reportModel.collectedFrom.required == true) {
      if (values.collectedFrom == undefined) {
        return ctx.badRequest(
          'You are missing a collectedFrom, this value should be either "missionReward", "collected", or "scanned".'
        );
      } else if (reportModel.collectedFrom.enum.includes(values.collectedFrom) == false) {
        // additional validation should occur here to ensure the category matches the enumeration value
        return ctx.badRequest(
          `The collectedFrom: "${values.collectedFrom}" you sent is not a valid one, this value should be either "missionReward", "collected", or "scanned".`
        );
      }
    }
  }

  await next();
};
