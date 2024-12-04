---@diagnostic disable: lowercase-global, undefined-global, trailing-space

local modid = 'DST_Nasus'

local data = _require('core_'..modid..'/data/stacks')

API.STACK:main(data)