local set_name = function(self, name)
	assert(type(name) == "string", "input type should be string")
	self._name = name
end

local get_name = function(self)
	return self._name
end

local parent_functions = {
	set_name = set_name,
	get_name = get_name,
}

local new = function()
	local self = {}
	local parent_params = {
		_name = "undefined",
	}
	setmetatable(self, {__index = parent_params})
	setmetatable(parent_params, {__index = parent_functions})
	return self
end

return {
	new = new
}
