local reset = function(self)
	self._t0		= nil
	self._t1		= nil
	self._delta_t	= nil
	self._grep		= false
end

local calculate_delta_t = function(self)
	self._delta_t	= (vci.me.Time - self._t0).Milliseconds * 0.001
end

local is_double_grip = function(self)
	if not self:on_grip() then return false end
	if self._t0 == nil or self._t1 == nil then return false end

	self:calculate_delta_t()
	if self._delta_t <= self._threshold then
		self:reset()
		return true
	else
		return false
	end
end

local is_single_grip = function(self)
	if not self:on_grip() then return false end
	if self._t0 == nil then return false end

	self:calculate_delta_t()
	if self._delta_t > self._threshold then
		self:reset()
		return true
	else
		return false
	end

end

local grip = function(self)
	self._grep = true
	if 		self._t0 == nil then self._t0 = vci.me.Time
	elseif	self._t0 ~= nil then self._t1 = vci.me.Time
	end
end

local on_grip = function(self)
	return self._grep
end

local set_threshold = function(self, num)
	assert(type(num) == "number", "input is not number")
	self._threshold = num
end

local functions = {
	reset = reset,
	is_single_grip = is_single_grip,
	is_double_grip = is_double_grip,
	set_threshold = set_threshold,
	grip = grip,
	on_grip = on_grip,
	calculate_delta_t = calculate_delta_t,
}

local new = function(self)
	local __member_params = {
		_t0			= nil,
		_t1			= nil,
		_delta_t	= nil,
		_threshold 	= 0.5,
		_grep		= false
	}
	return setmetatable(__member_params, {__index = functions})
end

return {
	new = new
}