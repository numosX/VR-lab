local set_name = function(self, str)
	assert(type(str) == "string", "input is not string")
	self._name = str
end

local get_name = function(self)
	return self._name
end

local count_up = function(self)
	self._counter = self._counter + 1
end

local get_counter = function(self)
	return self._counter
end

local member_functions = {
	set_name     = set_name,
	get_name     = get_name,
	count_up     = count_up,
	get_counter  = get_counter,
}

local new = function()
	local self = {}
	local member_params = {
		_name    = "undefined",
		_counter = 0,
	}
	setmetatable(self, {__index = member_params})
	setmetatable(member_params, {__index = member_functions})
	return self
end

return {
	new = new
}
