
---@class data_componentaction # 组件动作
---@field id string # 唯一ID,全大写
---@field str string # 动作描述
---@field fn fun(act: { doer: any|nil, target: any|nil, invobject: any|nil, GetActionPoint: fun(): Vector3}): boolean
---@field state string # 播放什么sg
---| '"give"' # 给予
---| '"doshortaction"' # 快速搓东西
---| '"domediumaction"' # 正常搓东西
---| '"dolongaction"' # 慢慢搓东西
---| '"castspell"' # 慢速释放法术
---| '"quickcastspell"' # 快速释放法术
---@field actiondata actiondata
---@field canqueuer string|nil # 兼容排队论
---| '"allclick"' # 默认
---| '"rightclick"' # 右键动作
---@field type string 动作类型
---| '"SCENE"' # 点击物品栏物品或世界的物品时执行,比如采集 <br> `testfn` args: inst, doer, actions, right <br> `fn`: `act.target` - `互动的目标`
---| '"USEITEM"' # 拿起某物品放到另一物品上执行,比如添加燃料 <br> `testfn` args: inst, doer, target, actions, right
---| '"POINT"' # 装备某手持物品或鼠标拎起某一物品时对地面执行 <br> `testfn` args: inst, doer, pos, actions, right
---| '"EQUIPPED"' # 装备某物品时激活，比如装备火把点火 <br> `testfn` args: inst, doer, target, actions, right
---| '"INVENTORY"' # 物品栏右键执行，比如吃东西 <br> `testfn` args: inst, doer, actions, right
---@field component string # 需要绑定的组件
---@field testfn fun(inst: any, doer: any, target: any, actions: any, right: any): boolean|fun(inst: any, doer: any, actions: any, right: any): boolean # 检测是否允许触发动作的函数

---@class actiondata
---@field priority number|nil # 优先级
---@field mount_valid boolean|nil # 骑乘使用
---@field distance number|nil # 距离

