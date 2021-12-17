-- FxControlHelper
-- Copyright (c) 2021 ぬーもす 
-- This script is released under the MIT License.

-- # Effect

local set_effect = function(self, vci_item_name)
	self._effect = vci.assets.GetEffekseerEmitter(vci_item_name)
end

local set_effect_loop = function(self, is_loop)
	self._is_effect_loop = is_loop
end

local enable_effect_loop = function(self)
	self:set_effect_loop(true)
end

local disable_effect_loop = function(self)
	self:set_effect_loop(false)
end

local play_effect = function(self)
	if self._effect == nil then return end
	if self._is_effect_loop then
		self._effect._ALL_Play()
	else
		self._effect._ALL_PlayOneShot()
	end
end

local stop_effect = function(self)
	if self._effect == nil then return end

	self._effect._ALL_Stop()
end

-- # Sound

local set_sound = function(self, audio_clip_name)
	self._audio_clip_name = audio_clip_name
end

local set_sound_volume = function(self, volume)
	assert(volume >= 0 and volume <= 1, "Volume should be from 0 to 1")
	self._audio_volume = volume
end

local set_sound_loop = function(self, is_loop)
	self._is_audio_loop = is_loop
end	

local enable_sound_loop = function(self)
	self:set_sound_loop(true)
end

local disable_sound_loop = function(self)
	self:set_sound_loop(false)
end


local play_sound = function(self)
	if self._audio_clip_name == nil then return end

	if self._is_sound_loop then
		vci.assets.audio._ALL_Play(self._audio_clip_name, self._audio_volume, true)
	else
		vci.assets.audio._ALL_PlayOneShot(self._audio_clip_name, self._audio_volume)
	end
end

local stop_sound = function(self)
	if self._audio_clip_name == nil then return end
	vci.assets.audio._ALL_Stop(self._audio_clip_name)
end


-- # Alias

local play = function(self)
	self:play_effect()
	self:play_sound()
end

local stop = function(self)
	self:stop_effect()
	self:stop_sound()
end

local functions = {
	set_effect = set_effect,
	set_effect_loop = set_effect_loop,
	enable_effect_loop = enable_effect_loop,
	disable_effect_loop = disable_effect_loop,
	play_effect = play_effect,
	stop_effect = stop_effect,
	set_sound = set_sound,
	set_sound_volume = set_sound_volume,
	set_sound_loop = set_sound_loop,
	enable_sound_loop = enable_sound_loop,
	disable_sound_loop = disable_sound_loop,
	play_sound = play_sound,
	stop_sound = stop_sound,
	play = play,
	stop = stop,
}


local new = function(self)
	local _member_params = {
		_effect				= nil,
		_is_effect_loop		= false,
		_audio_clip_name	= nil,
		_audio_volume		= 1,
		_is_sound_loop		= false,
	}
	return setmetatable(_member_params, {__index = functions})
end

return {
	new = new
}