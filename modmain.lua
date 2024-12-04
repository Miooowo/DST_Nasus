---@diagnostic disable: lowercase-global, undefined-global, trailing-space

GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})

---@type string
local modid = 'DST_Nasus' -- 定义唯一modid

PrefabFiles = {
	-- 'DST_Nasus_module_dishes',
	-- 'DST_Nasus_module_particle',

}

Assets = {

}
-- 导入常量表
modimport('scripts/core_'..modid..'/data/tuning.lua')

-- 导入工具
modimport('scripts/core_'..modid..'/utils/_register.lua')

-- 导入功能API
modimport('scripts/core_'..modid..'/api/_register.lua')

-- 导入mod配置
TUNING[string.upper('CONFIG_'..modid..'_LANG')] = GetModConfigData(modid..'_lang')

-- 导入语言文件
modimport('scripts/core_'..modid..'/languages/'..TUNING[string.upper('CONFIG_'..modid..'_LANG')]..'.lua')

-- 导入调用器
-- modimport('scripts/core_'..modid..'/callers/caller_badge.lua')
-- modimport('scripts/core_'..modid..'/callers/caller_ca.lua')
-- modimport('scripts/core_'..modid..'/callers/caller_changeactionsg.lua')
-- modimport('scripts/core_'..modid..'/callers/caller_container.lua')
-- modimport('scripts/core_'..modid..'/callers/caller_dish.lua')
-- modimport('scripts/core_'..modid..'/callers/caller_keyhandler.lua')
-- modimport('scripts/core_'..modid..'/callers/caller_recipes.lua')
-- modimport('scripts/core_'..modid..'/callers/caller_stack.lua')


-- 导入UI

-- 注册客机组件

-- 导入钩子



-- AddPlayerPostInit(function(inst)
--     if not TheWorld.ismastersim then
--         return inst
--     end
--     -- inst:DoTaskInTime(3, function()
--     --     local sakura_rain = SpawnPrefab('steam_discount')
--     --     -- sakura_rain.entity:SetParent(inst.entity)
--     --     sakura_rain.entity:AddFollower()
--     --     sakura_rain.Follower:FollowSymbol(inst.GUID, nil, 0, 0, 0)
--     -- end)
-- end)