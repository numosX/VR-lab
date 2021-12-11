local is_on = function(self)
    return self._is_on
end

local pad_on = function(self)
    self:initialize()
    self._is_on = true
end

local pad_off = function(self)
    self:calc_direction()
    self._is_on = false
end

local initialize = function(self)
    local pos_i = self._item.GetPosition()
    local rot_i = self._item.GetRotation()
    local pos_o = self._owner.GetPosition()
    pos_o.y = pos_i.y -- cuz pos_o.y = 0 

    local vec_i = pos_o - pos_i
    local vec_w = Vector3.__new(0,0,1)
    self._start_position = pos_i
    self._start_rotation = rot_i
    self._q_world2item   = Quaternion.FromToRotation(vec_w, vec_i)
end

local calc_direction = function(self)
    local pos_i         = self._item.GetPosition()
    local dr            = pos_i - self._start_position
    self._v_direction   = self._q_world2item*dr
    self._direction_string  =  self:vector_to_direction(self._v_direction)
end

local get_direction_string = function(self)
    return self._direction_string
end

local vector_to_direction = function(self, vector)
    local dx = vector.x
    local dy = vector.y
    if math.abs(dx) > math.abs(dy) then
        if dx < 0 then return "left" else return "right" end
    else
        if dy < 0 then return "down" else return "up" end
    end 

end

local methods = {
    is_on = is_on,
	pad_on = pad_on,
    initialize = initialize,
	pad_off = pad_off,
    calc_direction = calc_direction,
    get_direction_string = get_direction_string,
    vector_to_direction = vector_to_direction,
}


local new = function(self, item_name)
    local obj = vci.assets.GetTransform(item_name)
    if obj == nil then
        print("[!] DirectionalCube: Initialization Error")
        print("missing vci subitem "..item_name)
        return nil
    end

    local __member_params = {
        _item               = obj,
        _owner              = vci.studio.GetOwner(),
        _start_position     = Vector3.__new(0,0,0),
        _start_rotation     = Quaternion.identity,
        _q_world2item       = Quaternion.identity,
        _v_direction        = Vector3.__new(0,0,0),
        _direction_string   = nil,
        _is_on              = false
    }
    return setmetatable(__member_params, {__index = methods})
end

return {
	new = new
}