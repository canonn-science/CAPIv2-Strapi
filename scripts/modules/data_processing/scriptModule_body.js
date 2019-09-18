// Processing system data from CAPIv2 or EDSM
const processBody = async (source, data, systemID) => {
  let newData = {};

  newData.system = systemID;

  if (source === 'report') {
    newData.bodyName = data.bodyName.toUpperCase();
  } else if (source === 'capiv2') {
    newData.bodyName = data.bodyName.toUpperCase();
    newData.id64 = data.id64 || null;
    newData.edsmID = data.edsmID || null;
    newData.bodyID = data.bodyID || null;
    newData.type = data.type || null;
    newData.subType = data.subType || null;
    newData.offset = data.offset || null;
    newData.distanceToArrival = data.distanceToArrival || null;
    newData.isMainStar = data.isMainStar || null;
    newData.isScoopable = data.isScoopable || null;
    newData.isLandable = data.isLandable || null;
    newData.age = data.age || null;
    newData.luminosity = data.luminosity || null;
    newData.absoluteMagnitude = data.absoluteMagnitude || null;
    newData.solarMasses = data.solarMasses || null;
    newData.solarRadius = data.solarRadius || null;
    newData.gravity = data.gravity || null;
    newData.earthMasses = data.earthMasses || null;
    newData.radius = data.radius || null;
    newData.surfaceTemperature = data.surfaceTemperature || null;
    newData.surfacePressure = data.surfacePressure || null;
    newData.volcanismType = data.volcanismType || null;
    newData.atmosphereType = data.atmosphereType || null;
    newData.terraformingState = data.terraformingState || null;
    newData.orbitalPeriod = data.orbitalPeriod || null;
    newData.semiMajorAxis = data.semiMajorAxis || null;
    newData.orbitalEccentricity = data.orbitalEccentricity || null;
    newData.orbitalInclination = data.orbitalInclination || null;
    newData.argOfPeriapsis = data.argOfPeriapsis || null;
    newData.rotationalPeriod = data.rotationalPeriod || null;
    newData.rotationalPeriodTidallyLocked = data.rotationalPeriodTidallyLocked || null;
    newData.axialTilt = data.axialTilt || null;
    newData.solidComposition = data.solidComposition || {};
    newData.atmosphere = data.atmosphere || {};
    newData.material = data.material || {};
  } else if (source === 'edsm') {
    newData.bodyName = data.name.toUpperCase();
    newData.id64 = data.id64 || null;
    newData.edsmID = data.id || null;
    newData.bodyID = data.bodyId || null;
    newData.type = data.type || null;
    newData.subType = data.subType || null;
    newData.distanceToArrival = data.distanceToArrival || null;
    newData.isMainStar = data.isMainStar || null;
    newData.isScoopable = data.isScoopable || null;
    newData.isLandable = data.isLandable || null;
    newData.age = data.age || null;
    newData.luminosity = data.luminosity || null;
    newData.absoluteMagnitude = data.absoluteMagnitude || null;
    newData.solarMasses = data.solarMasses || null;
    newData.solarRadius = data.solarRadius || null;
    newData.gravity = data.gravity || null;
    newData.earthMasses = data.earthMasses || null;
    newData.radius = data.radius || null;
    newData.surfaceTemperature = data.surfaceTemperature || null;
    newData.surfacePressure = data.surfacePressure || null;
    newData.volcanismType = data.volcanismType || null;
    newData.atmosphereType = data.atmosphereType || null;
    newData.terraformingState = data.terraformingState || null;
    newData.orbitalPeriod = data.orbitalPeriod || null;
    newData.semiMajorAxis = data.semiMajorAxis || null;
    newData.orbitalEccentricity = data.orbitalEccentricity || null;
    newData.orbitalInclination = data.orbitalInclination || null;
    newData.argOfPeriapsis = data.argOfPeriapsis || null;
    newData.rotationalPeriod = data.rotationalPeriod || null;
    newData.rotationalPeriodTidallyLocked = data.rotationalPeriodTidallyLocked || null;
    newData.axialTilt = data.axialTilt || null;
    newData.solidComposition = data.solidComposition || {};
    newData.atmosphere = data.atmosphereComposition || {};
    newData.material = data.materials || {};
  }

  return newData;
};

module.exports = { processBody };

