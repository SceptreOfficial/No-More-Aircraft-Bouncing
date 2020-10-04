class CfgPatches {
	class NMAB {
		name = "$STR_NMAB_Title";
		version = 1;
		author = "Sceptre";
		authors[] = {"Sceptre"};
		url = "";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.9;
		requiredAddons[] = {
			"cba_common",
			"cba_events",
			"cba_xeh"
		};
	};
};

class CfgFunctions {
	class NMAB {
		tag = "NMAB";
		class functions {
			file = "nmab\functions";
			class antiBounce {};
			class particles {};
		};
	};
};

class Extended_PreInit_EventHandlers {
	class NMAB_preInit {
		init = "call compile preprocessFileLineNumbers 'nmab\XEH_preInit.sqf'";
	};
};
