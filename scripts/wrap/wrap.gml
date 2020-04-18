var _val   = argument0;
var _min   = argument1;
var _max   = argument2;

if (_val > _max) return _min;
if (_val < _min) return _max;

return _val;