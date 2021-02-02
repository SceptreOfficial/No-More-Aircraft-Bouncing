[
	"NMAB_setting_classExclusionsStr","EDITBOX",
	["STR_NMAB_SettingName_classExclusions","STR_NMAB_SettingInfo_classExclusions"],
	["STR_NMAB_Title","STR_NMAB_SettingCategory_Compatibility"],
	"",
	true,
	{NMAB_classExclusions = ((_this splitString ",") apply {toLower _x}) + (uiNamespace getVariable ["NMAB_classExclusions",[]])},
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

["Air","Killed",NMAB_fnc_killed] call CBA_fnc_addClassEventHandler;
["NMAB_triggered",NMAB_fnc_particles] call CBA_fnc_addEventHandler;
