local ParentClass = require "parent_class"

local set_val = function(self, val)
	assert(type(val) == "number", "input should be number")
	self._child_val = val
end

local get_val = function(self)
	return self._child_val
end

local child_functions = {
	set_val = set_val,
	get_val = get_val,
}

local new = function()
	local parent_class = ParentClass:new()
	local self = {}
	local child_params = {
		_child_val = nil
	}
	setmetatable(self, {__index = child_params})
	setmetatable(child_params, {__index = child_functions})
	setmetatable(child_functions, {__index = parent_class})
	return self
end

return {
	new = new
}