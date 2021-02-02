class CfgPatches {
	class NMAB {
		name = "$STR_NMAB_Title";
		version = 1.1;
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

class CfgVehicles {
	class Helicopter;
	class ParachuteBase : Helicopter {
		NMAB_exclude = 1;
	};

	class Helicopter_Base_F;
	class UAV_01_base_F : Helicopter_Base_F {
		NMAB_exclude = 1;
	};
	class UAV_06_base_F : Helicopter_Base_F {
		NMAB_exclude = 1;
	};
};

class Extended_PreStart_EventHandlers {
	class ADDON {
		init = "call compile preprocessFileLineNumbers 'nmab\XEH_preStart.sqf'";
	};
};

class Extended_PreInit_EventHandlers {
	class NMAB_preInit {
		init = "call compile preprocessFileLineNumbers 'nmab\XEH_preInit.sqf'";
	};
};
