params ["_vehicle"];

if (toLower typeOf _vehicle in NMAB_classExclusions) exitWith {};

if (isTouchingGround _vehicle) then {
	_vehicle call NMAB_fnc_antiBounce;
	["NMAB_triggered",_vehicle] call CBA_fnc_globalEvent;
} else {
	[{
		isNull _this || {isTouchingGround _this}
	},{
		if (isNull _this) exitWith {};
		_this call NMAB_fnc_antiBounce;
		["NMAB_triggered",_this] call CBA_fnc_globalEvent;
	},_vehicle,30,{}] call CBA_fnc_waitUntilAndExecute;
};
