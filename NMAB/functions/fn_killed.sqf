params ["_vehicle"];

if (toLower typeOf _vehicle in NMAB_classExclusions) exitWith {};

[{
	isNull _this || {isTouchingGround _this}
},{
	if (isNull _this) exitWith {};

	[{
		params ["_vehicle","_minTime"];

		if (isNull _vehicle) exitWith {true};

		private _vel = velocity _vehicle;

		if (_vel # 2 > 0) then {
			_vehicle setVelocity [_vel # 0,_vel # 1,-1];
		};

		_vel # 0 < 1 && _vel # 1 < 1 && _minTime < CBA_missionTime
	},{},[_this,CBA_missionTime + 5],15] call CBA_fnc_waitUntilAndExecute;

	["NMAB_triggered",_this] call CBA_fnc_globalEvent;
},_vehicle,60,{}] call CBA_fnc_waitUntilAndExecute;
