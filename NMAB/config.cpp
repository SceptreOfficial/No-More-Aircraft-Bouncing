#define VERSION "0.4"
#define REQUIRED_VERSION 1.9

class CfgPatches {
	class NMAB {
		name = "No More Aircraft Bouncing";
		version = VERSION;
		author = "Sceptre";
		authors[] = {"Sceptre"};
		url = "";
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
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
			file = "NMAB\functions";
			class antiBounce {};
			class particles {};
		};
	};
};

class Extended_PreInit_EventHandlers {
	class NMAB_preInit {
		init = "call compile preprocessFileLineNumbers 'NMAB\XEH_preInit.sqf'";
	};
};
