if (!hasInterface) exitWith {};

params ["_vehicle"];

if (NMAB_setting_pfxHelicopters && _vehicle isKindOf "Helicopter") then {
	private _p1 = "#particlesource" createVehicleLocal getPos _vehicle;
	_p1 setParticleClass "IEDMineGarbageBig1";
	_p1 attachTo [_vehicle,[0,0,0]];
	[{deleteVehicle _this},_p1,2] call CBA_fnc_waitAndExecute;

	private _p2 = "#particlesource" createVehicleLocal getPos _vehicle;
	_p2 setParticleClass "BombSmk3";
	_p2 attachTo [_vehicle,[0,0,0]];
	[{deleteVehicle _this},_p2,2] call CBA_fnc_waitAndExecute;
};

if (NMAB_setting_pfxPlanes && _vehicle isKindOf "Plane") then {
	private _p1 = "#particlesource" createVehicleLocal getPos _vehicle;
	_p1 setParticleClass "BombExp1";
	_p1 attachTo [_vehicle,[0,0,0]];
	[{deleteVehicle _this},_p1,1.3] call CBA_fnc_waitAndExecute;

	private _p2 = "#particlesource" createVehicleLocal getPos _vehicle;
	_p2 setParticleClass "BombSmk3";
	_p2 attachTo [_vehicle,[0,0,0]];
	[{deleteVehicle _this},_p2,2] call CBA_fnc_waitAndExecute;
};
