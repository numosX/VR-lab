local setName = function(self, str)
    assert(type(str) == "string", "input is not string")
    self.name = str
end

local getName = function(self)
    return self.name
end

local countUp = function(self)
    self.counter = self.counter + 1
end

local getCounter = function(self)
    return self.counter
end

local public_functions = {
    setName     = setName,
    getName     = getName,
    countUp     = countUp,
    getCounter  = getCounter,
}

local new = function()
    local __member_params = {
        name    = "undefined",
        counter = 0,
    }
    return setmetatable(__member_params, {__index = public_functions})
end

return {
    new = new
}
