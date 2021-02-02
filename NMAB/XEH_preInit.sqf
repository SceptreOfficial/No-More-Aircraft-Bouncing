[
	"NMAB_setting_classExclusions","EDITBOX",
	["STR_NMAB_SettingName_classExclusions","STR_NMAB_SettingInfo_classExclusions"],
	["STR_NMAB_Title","STR_NMAB_SettingCategory_Compatibility"],
	"",
	true,
	{NMAB_classExclusions = (_this splitString ",") apply {toLower _x}},
	false
] call CBA_fnc_addSetting;

[
	"NMAB_setting_pfxHelicopters","CHECKBOX",
	["STR_NMAB_SettingName_pfxHelicopters","STR_NMAB_SettingInfo_pfxHelicopters"],
	["STR_NMAB_Title","STR_NMAB_SettingCategory_ParticleEffects"],
	true,
	false,
	{},
	false
] call CBA_fnc_addSetting;

[
	"NMAB_setting_pfxPlanes","CHECKBOX",
	["STR_NMAB_SettingName_pfxPlanes","STR_NMAB_SettingInfo_pfxPlanes"],
	["STR_NMAB_Title","STR_NMAB_SettingCategory_ParticleEffects"],
	true,
	false,
	{},
	false
] call CBA_fnc_addSetting;

["Air","Killed",{
	params ["_vehicle"];

	if (
		toLower typeOf _vehicle in NMAB_classExclusions ||
		{_vehicle isKindOf "UAV_01_base_F"} ||
		{_vehicle isKindOf "UAV_06_base_F"} ||
		{_vehicle isKindOf "ParachuteBase"}
	) exitWith {};

	if (getPos _vehicle # 2 < 8) then {
		_vehicle call NMAB_fnc_antiBounce;
		_vehicle remoteExecCall ["NMAB_fnc_particles",0];
		["NMAB_triggered",_vehicle] call CBA_fnc_globalEvent;
	} else {
		[{
			isNull _this || {getPos _this # 2 < 8}
		},{
			if (isNull _this) exitWith {};

			_this call NMAB_fnc_antiBounce;
			_this remoteExecCall ["NMAB_fnc_particles",0];
			["NMAB_triggered",_vehicle] call CBA_fnc_globalEvent;
		},_vehicle,30,{}] call CBA_fnc_waitUntilAndExecute;
	};
}] call CBA_fnc_addClassEventHandler;
