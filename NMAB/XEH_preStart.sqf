private _classExclusions = [];

{
	if (getNumber (_x >> "NMAB_exclude") > 0) then {
		_classExclusions pushBack toLower configName _x;
	};
} forEach configProperties [configFile >> "CfgVehicles","isClass _x",false];

uiNamespace setVariable ["NMAB_classExclusions",_classExclusions];
