UPDATE capiv2_example.systems, capiv2_exampleOld.systems
SET capiv2_example.systems.id64 = capiv2_exampleOld.systems.id64,
	capiv2_example.systems.edsmID = capiv2_exampleOld.systems.edsmID,
	capiv2_example.systems.edsmCoordX = capiv2_exampleOld.systems.edsmCoordX,
	capiv2_example.systems.edsmCoordY = capiv2_exampleOld.systems.edsmCoordY,
	capiv2_example.systems.edsmCoordZ = capiv2_exampleOld.systems.edsmCoordZ,
	capiv2_example.systems.edsmCoordLocked = capiv2_exampleOld.systems.edsmCoordLocked,
	capiv2_example.systems.missingSkipCount = capiv2_exampleOld.systems.missingSkipCount,
	capiv2_example.systems.primaryStar = capiv2_exampleOld.systems.primaryStar
WHERE capiv2_example.systems.systemName like capiv2_exampleOld.systems.systemName;
