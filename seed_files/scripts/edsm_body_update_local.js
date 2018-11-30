// This is a test script used to manually update all body data using a browser console window.
// We will modify and rip apart this to be used in API lifecycle callbacks,
// Just leaving it here for quick reference.

// Safety first.
const TOKEN = 'OH NO YOU DONT';

// API urls
const API_CANONN_GRAPHQL = 'https://api.canonn.tech:2083/graphql'
const API_BODY_URL = 'https://api.canonn.tech:2083/bodies/'
const API_EDSM_BODIES = 'https://www.edsm.net/api-system-v1/bodies?systemName='

// Arrays used for data manipulation
const uniqueSystems = [];
const allBodies = [];

// Start here
window.updateBodies = () => {

	new Promise( (resolve, reject) => getCanonnBodies(resolve, reject) ).then( () => {

		console.log('%c --- All bodies grabbed: ','background: #4980bf; color: #fff', allBodies);

		constructSystemArray(allBodies);
		processSystems(uniqueSystems, getEDSMSystem);
	})

}

const getCanonnBodies = (resolve, reject, counter) => {
	const step = 1000;
	var start = counter || 0;

	const API_URL = 'https://api.canonn.tech:2083/graphql';
	const options = {
		method: 'POST',
		headers: { 'Content-Type': 'application/json' }
	}

	fetch(API_URL, {
		...options,
		body: JSON.stringify({
			query: '{ bodies(limit: '+step+', start:'+start+'){ id bodyName system{ id systemName } } }'
		})
	})
	.then( r => r.json() )
	.then( r => {
		let data = r.data.bodies;
		console.log('+ Grabbed ['+data.length+'] bodies from Canonn API');

		allBodies.push(...data);

		if(data.length == step) {
			getCanonnBodies(resolve, reject, start+step);
		} else {
			resolve();
		}
	})

}

const constructSystemArray = (bodies) => {

	bodies.forEach( body => {

		if( !uniqueSystems[body.system.systemName] ) {

			let newSystem = {
				id: body.system.id,
				systemName: body.system.systemName,
				bodies: []
			};

			newSystem.bodies.push({
				id: body.id,
				bodyName: body.bodyName
			});

			uniqueSystems[body.system.systemName] = newSystem;

		} else {
			uniqueSystems[body.system.systemName].bodies.push({
				id: body.id,
				bodyName: body.bodyName
			});
		}

	});

}

const updateBody = (body) => {

	console.log('Updating body in API:', body.bodyName);

	// Get rid of unneeded fields.
	const payload = {...body};
		delete payload.bodyName;
		delete payload.id;

	console.log('payload', payload);

	const options = {
		method: 'PUT',
		headers: {
			'Content-Type': 'application/json',
			'Authorization': 'Bearer '+TOKEN
		},
		body: JSON.stringify(payload)
	}

	fetch(API_BODY_URL+body.id, options).then(r => {
		if(r.status == 200) {

			try {
				const resp = r.json();

			} catch(e) {
				console.log('ERROR on saving to Canonn API: ');
				console.log('Payload:', payload);
			}

		} else {
			console.log('ERROR on saving to Canonn API: ');
			console.log('Payload:', payload);
		}

	});

}

const getEDSMSystem = (system) => {

	console.log('%c Fetch EDSM system: ','background: #ececec', system);

	return new Promise(function(resolve, reject) {

		fetch(API_EDSM_BODIES+system.systemName, {
			method: 'GET'
		}).then(r => r.json()).then( r=> {

			console.log('EDSM reply:', r);

			const edsmBodies = r.bodies;

			edsmBodies.forEach( edsmBody => {

				system.bodies.forEach( canonnBody => {

					if( canonnBody.bodyName.toUpperCase() == edsmBody.name.toUpperCase() ) {

						if(edsmBody.id) 							{ canonnBody.edsmID = edsmBody.id }
						if(edsmBody.bodyId) 						{ canonnBody.bodyID = edsmBody.bodyId }
						if(edsmBody.id64) 							{ canonnBody.id64 = edsmBody.id64 }
						if(edsmBody.type) 							{ canonnBody.type = edsmBody.type }
						if(edsmBody.subType) 						{ canonnBody.subType = edsmBody.subType }
						if(edsmBody.offset) 						{ canonnBody.offset = edsmBody.offset }
						if(edsmBody.distanceToArrival) 				{ canonnBody.distanceToArrival = edsmBody.distanceToArrival }
						if(edsmBody.isMainStar) 					{ canonnBody.isMainStar = edsmBody.isMainStar }
						if(edsmBody.isScoopable) 					{ canonnBody.isScoopable = edsmBody.isScoopable }
						if(edsmBody.isLandable) 					{ canonnBody.isLandable = edsmBody.isLandable }
						if(edsmBody.age) 							{ canonnBody.age = edsmBody.age }
						if(edsmBody.luminosity) 					{ canonnBody.luminosity = edsmBody.luminosity }
						if(edsmBody.absoluteMagnitude) 				{ canonnBody.absoluteMagnitude = edsmBody.absoluteMagnitude }
						if(edsmBody.solarMasses) 					{ canonnBody.solarMasses = edsmBody.solarMasses }
						if(edsmBody.solarRadius) 					{ canonnBody.solarRadius = edsmBody.solarRadius }
						if(edsmBody.gravity) 						{ canonnBody.gravity = edsmBody.gravity }
						if(edsmBody.earthMasses) 					{ canonnBody.earthMasses = edsmBody.earthMasses }
						if(edsmBody.radius) 						{ canonnBody.radius = edsmBody.radius }
						if(edsmBody.surfaceTemperature) 			{ canonnBody.surfaceTemperature = edsmBody.surfaceTemperature }
						if(edsmBody.surfacePressure) 				{ canonnBody.surfacePressure = edsmBody.surfacePressure }
						if(edsmBody.volcanismType) 					{ canonnBody.volcanismType = edsmBody.volcanismType }
						if(edsmBody.atmosphereType) 				{ canonnBody.atmosphereType = edsmBody.atmosphereType }
						if(edsmBody.terraformingState) 				{ canonnBody.terraformingState = edsmBody.terraformingState }
						if(edsmBody.orbitalPeriod) 					{ canonnBody.orbitalPeriod = edsmBody.orbitalPeriod }
						if(edsmBody.semiMajorAxis) 					{ canonnBody.semiMajorAxis = edsmBody.semiMajorAxis }
						if(edsmBody.orbitalEccentricity) 			{ canonnBody.orbitalEccentricity = edsmBody.orbitalEccentricity }
						if(edsmBody.orbitalInclination) 			{ canonnBody.orbitalInclination = edsmBody.orbitalInclination }
						if(edsmBody.argOfPeriapsis) 				{ canonnBody.argOfPeriapsis = edsmBody.argOfPeriapsis }
						if(edsmBody.rotationalPeriod) 				{ canonnBody.rotationalPeriod = edsmBody.rotationalPeriod }
						if(edsmBody.rotationalPeriodTidallyLocked) 	{ canonnBody.rotationalPeriodTidallyLocked = edsmBody.rotationalPeriodTidallyLocked }
						if(edsmBody.axialTilt) 						{ canonnBody.axialTilt = edsmBody.axialTilt }

						if(edsmBody.solidComposition) 				{ canonnBody.solidComposition = edsmBody.solidComposition }
						if(edsmBody.atmosphere) 					{ canonnBody.atmosphere = edsmBody.atmosphere }
						if(edsmBody.materials) 						{ canonnBody.material = edsmBody.materials }

						updateBody(canonnBody);

					}

				});

			});

			let AnthorsDelay = setTimeout( () => {
				resolve();
			}, 3000);

		});

	});

}

const processSystems = (systems, fn) => {
	var index = 0;
	const systemNames = Object.keys(systems);

	return new Promise(function(resolve, reject) {
		function next() {
			if(index < systemNames.length) {

				let nextSystem = systems[ systemNames[index++] ];

				console.log('%c ~~ Doing system: ','background: #7e983f; color: #fff',  nextSystem.systemName);

				fn(nextSystem).then(next);
			} else {
				console.log('--- Completed ['+index+'] systems');
				resolve();
			}
		}
		next();
	});
}

const capitalizeFirstLetter = (string) => {
    return string.charAt(0).toUpperCase() + string.slice(1);
}
