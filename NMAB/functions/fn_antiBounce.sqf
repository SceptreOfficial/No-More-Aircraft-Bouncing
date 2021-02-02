[{
	params ["_vehicle","_startTime"];

	if (isNull _vehicle) exitWith {true};

	private _vel = velocity _vehicle;

	// Slow down and fall
	if (getPos _vehicle # 2 > 5) then {
		_vel = [_vel # 0 * 0.95,_vel # 1 * 0.95,_vel # 2 - 0.2];
		_vehicle setVelocity _vel;
	};

	// Prevent upwards velocity
	if (_vel # 2 > 0) then {
		_vehicle setVelocity [_vel # 0,_vel # 1,-1];
	};

	(_vel # 0 < 1 && _vel # 1 < 1) && (_startTime + 4) < CBA_missionTime
},{},[_this,CBA_missionTime],10] call CBA_fnc_waitUntilAndExecute;
