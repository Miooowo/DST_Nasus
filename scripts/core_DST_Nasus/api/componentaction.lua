-- @lan: _开头的方法是内部方法,一般来说不要在外部调用
---@diagnostic disable: lowercase-global, undefined-global, trailing-space

---@class api_componentaction # 组件动作 API
local dst_lan = {}

---comment
---@param data_tbl table
---@return table # actions
---@return table # componentactions table
function dst_lan:_fix_tbl(data_tbl)
    local fixed_actions = {}
    local fixed_component_actions = {}

    for _,item in pairs(data_tbl) do
        local pal = item.type .. item.component
        if fixed_component_actions[pal] == nil then
            fixed_component_actions[pal] = {
                type = item.type,
		        component = item.component,
                tests = {
                    {
                        action = item.id,
                        testfn = item.testfn,
                    },
                },
            }
        else
            table.insert(fixed_component_actions[pal].tests,{
                action = item.id,
                testfn = item.testfn,
            })
        end
        table.insert(fixed_actions,{
            id = item.id,
            str = item.str,
            fn = item.fn,
            state = item.state,
            actiondata = item.actiondata,
        })
    end
    return fixed_actions,fixed_component_actions
end

---------------------------------------------------------------
-- 请参考下表来写/Please refer to the table below for writing --
---------------------------------------------------------------

-- local example_data_tbl = {
--     {
--         --------------------------------
--         -- actions ---------------------
--         --------------------------------
-- 		id = "DSTLAN_REPAIR_SPEAR", -- 唯一ID,全大写
-- 		str = 'repair spear', -- 描述
-- 		fn = function(act) -- 执行函数,注意如果没有返回true,人物则会说我做不到
--             -- 参数描述: 
--             -- act.doer: 做出动作的人
--             -- act.invobject: 就是物品自身
--             -- act.target: 被互动的目标
--             -- act.pos: 鼠标点击位置,Vector3,可以用:Get()来分离
-- 			if act.doer ~= nil and act.invobject ~= nil and act.target ~= nil then
--              return repairFn(act.invobject,act.target) -- 要执行的函数,注意函数要返回一个布尔值,用于让玩家知道动作是否成功
-- 			end
--          return false
-- 		end,
-- 		state = "give", -- sg 播放什么sg
--             -- 常用sg
--             -- doshortaction -- 快速搓东西
--             -- domediumaction -- 正常搓东西
--             -- dolongaction -- 慢慢搓东西
--             -- quickcastspell -- 快速释放法术
-- 		actiondata = {
-- 			priority = 99, -- 优先级
-- 			mount_valid = true, -- 是否可以骑乘使用
-- 		},

--         -- canqueuer = "rightclick", --兼容排队论 allclick为默认 rightclick为右键动作
--         --------------------------------
--         -- 绑定组件 ---------------------
--         --------------------------------
--         type = 'USEITEM', -- 类型
--         --      SCENE -- 点击物品栏物品或世界的物品时执行,比如采集
--         --      USEITEM -- 拿起某物品放到另一物品上执行,比如添加燃料
--         --      POINT -- 装备某手持物品或鼠标拎起某一物品时对地面执行
--         --      EQUIPPED -- 装备某物品时激活，比如装备火把点火
--         --      INVENTORY -- 物品栏右键执行，比如吃东西
--         component = 'inventoryitem', -- 需要绑定的组件
--         testfn = function(inst, doer, target, actions, right) -- 检测是否允许触发动作的函数,注意不同的类型参数不一样
--             -- SCENE args: inst, doer, actions, right
--             -- USEITEM args: inst, doer, target, actions, right
--             -- POINT args: inst, doer, pos, actions, right
--             -- EQUIPPED args: inst, doer, target, actions, right
--             -- INVENTORY args: inst, doer, actions, right
--             -- ISVALID args: inst, action, right
--             -- 参数简述: 
--                 -- inst: 自身,就是被绑定组件的实体
--                 -- doer: 做出动作的人
--                 -- target: 被互动的目标
--                 -- right: 是否为右键动作
--             -- 返回false则不显示能触发该动作
--             -- 注意判断显不显示动作是客机内容,想写什么.components的就免了
--             return doer:HasTag("player") and inst.prefab == 'flint' and target.prefab == 'spear' 
--         end,
-- 	},
-- }


function dst_lan:registActions(data_tbl)
    local fixed_actions,fixed_component_actions = self:_fix_tbl(data_tbl)

    for _,act in pairs(fixed_actions) do
        local addaction = AddAction(act.id,act.str,act.fn)
        if act.actiondata then
            for k,v in pairs(act.actiondata) do
                addaction[k] = v
            end
        end

        AddStategraphActionHandler('wilson',GLOBAL.ActionHandler(addaction, act.state))
        AddStategraphActionHandler('wilson_client',GLOBAL.ActionHandler(addaction,act.state))
    end

    for _,v in pairs(fixed_component_actions) do
        local testfn = function(...)
            local actions = GLOBAL.select(v.type=='POINT' and -3 or -2,...)
            for _,data in pairs(v.tests) do
                if data and data.testfn and data.testfn(...) then
                    data.action = string.upper(data.action)
                    table.insert(actions,GLOBAL.ACTIONS[data.action])
                end
            end
        end
        AddComponentAction(v.type, v.component, testfn)
    end
end

function dst_lan:main(data_tbl)
    self:registActions(data_tbl)
end

return dst_lan
