[
	"NMAB_setting_particlesEnabled",
	"CHECKBOX",
	["Enable extra particle effects","Enables extra fire, smoke, and particles created from wrecks. (Default: True)"],
	"NMAB Settings",
	true
] call CBA_fnc_addSetting;

["Air","Killed",{
	params ["_vehicle"];

	if (_vehicle isKindOf "UAV_01_base_F" ||
		_vehicle isKindOf "UAV_06_base_F" ||
		_vehicle isKindOf "ParachuteBase"
	) exitWith {};

	if ((getPos _vehicle) # 2 < 8) then {
		_vehicle call NMAB_fnc_antiBounce;
		_vehicle remoteExec ["NMAB_fnc_particles",0];
	} else {
		[{
			isNull _this || {(getPos _this) # 2 < 8}
		},{
			if (isNull _this) exitWith {};

			_this call NMAB_fnc_antiBounce;
			_this remoteExec ["NMAB_fnc_particles",0];
		},_vehicle,30,{}] call CBA_fnc_waitUntilAndExecute;
	};
}] call CBA_fnc_addClassEventHandler;
