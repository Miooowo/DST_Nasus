---@class data_changeactionsg
---@field action table|action_name # 动作,直接填全局动作表即可,例如 `ACTIONS.BUILD` ,填字符串 `"BUILD"` 则从全局动作表中查找
---@field sg string # sg
---@field testfn fun(doer: any): boolean # 服务器端执行
---@field testfn_client fun(doer: any): boolean # 客户端执行


---@alias action_name string # 动作key
---| '"YOTB_UNLOCKSKIN"'
---| '"TURNON"'
---| '"NET"'
---| '"UNWRAP"'
---| '"MUTATE_SPIDER"'
---| '"STEALMOLEBAIT"'
---| '"ABANDON_SHIP"'
---| '"CHECKTRAP"'
---| '"RESETMINE"'
---| '"CAST_NET"'
---| '"TURNOFF"'
---| '"PICK"'
---| '"INCINERATE"'
---| '"SHAVE"'
---| '"SITON"'
---| '"CHARGE_FROM"'
---| '"SALT"'
---| '"USEKLAUSSACKKEY"'
---| '"USE_WEREFORM_SKILL"'
---| '"FISH"'
---| '"STOP_CHANNELCAST"'
---| '"CLOSESPELLBOOK"'
---| '"USESPELLBOOK"'
---| '"DRY"'
---| '"ERASE_PAPER"'
---| '"WINTERSFEAST_FEAST"'
---| '"CARNIVALGAME_FEED"'
---| '"STOPCHANNELING"'
---| '"CHOP"'
---| '"HITCHUP"'
---| '"CYCLE"'
---| '"EQUIP"'
---| '"RETURN_FOLLOWER"'
---| '"WRAPBUNDLE"'
---| '"REPAIR_LEAK"'
---| '"SCYTHE"'
---| '"REMOVEMODULES_FAIL"'
---| '"REMOVEMODULES"'
---| '"APPLYMODULE_FAIL"'
---| '"ROTATE_BOAT_COUNTERCLOCKWISE"'
---| '"CATPLAYAIR"'
---| '"SUMMONGUARDIAN"'
---| '"BUNDLE"'
---| '"HAMMER"'
---| '"LEAVE_GYM"'
---| '"CAST_POCKETWATCH"'
---| '"UNLOAD_GYM"'
---| '"OCEAN_FISHING_STOP"'
---| '"LOOKAT"'
---| '"STOP_LIFT_DUMBBELL"'
---| '"YOTB_SEW"'
---| '"LIFT_GYM_SUCCEED"'
---| '"REMOTE_TELEPORT"'
---| '"REPLATE"'
---| '"TOGGLE_DEPLOY_MODE"'
---| '"ADDFUEL"'
---| '"DEPLOY_TILEARRIVE"'
---| '"EXTEND_PLANK"'
---| '"APPLYPRESERVATIVE"'
---| '"REPEL"'
---| '"OCEAN_TOSS"'
---| '"HERD_FOLLOWERS"'
---| '"BOAT_CANNON_STOP_AIMING"'
---| '"NUZZLE"'
---| '"HIDEANSEEK_FIND"'
---| '"EXTINGUISH"'
---| '"POUR_WATER_GROUNDTILE"'
---| '"ACTION_YMH_TEND_FARMPLANT"'
---| '"GIVETOPLAYER"'
---| '"CASTUNSUMMON"'
---| '"PLANTREGISTRY_RESEARCH"'
---| '"BOAT_MAGNET_BEACON_TURN_OFF"'
---| '"MANUALEXTINGUISH"'
---| '"ROTATE_BOAT_STOP"'
---| '"ROW_CONTROLLER"'
---| '"BOAT_CANNON_SHOOT"'
---| '"CARNIVAL_HOST_SUMMON"'
---| '"EMPTY_CONTAINER"'
---| '"DIG"'
---| '"REEL"'
---| '"TALKTO"'
---| '"OCEAN_TRAWLER_FIX"'
---| '"POLLINATE"'
---| '"DROP"'
---| '"MURDER"'
---| '"SING"'
---| '"ABANDON"'
---| '"BREAK"'
---| '"FILL"'
---| '"OCEAN_TRAWLER_LOWER"'
---| '"BOAT_CANNON_START_AIMING"'
---| '"PET"'
---| '"INVESTIGATE"'
---| '"LIGHT"'
---| '"BOARDPLATFORM"'
---| '"FISH_OCEAN"'
---| '"LAYEGG"'
---| '"BOAT_MAGNET_DEACTIVATE"'
---| '"FERTILIZE"'
---| '"DISMANTLE"'
---| '"SLAUGHTER"'
---| '"ABANDON_QUEST"'
---| '"MOUNT"'
---| '"BOAT_MAGNET_ACTIVATE"'
---| '"GOHOME"'
---| '"APPLYMODULE"'
---| '"ROTATE_BOAT_CLOCKWISE"'
---| '"OPEN_CRAFTING"'
---| '"COOK"'
---| '"BUILD"'
---| '"JUMPIN"'
---| '"WAX"'
---| '"PERFORM"'
---| '"GIVEALLTOPLAYER"'
---| '"RAISE_SAIL"'
---| '"GIVE"'
---| '"HITCH"'
---| '"MIGRATE"'
---| '"PLANTWEED"'
---| '"CATCH"'
---| '"ENTER_GYM"'
---| '"APPRAISE"'
---| '"REPAIR"'
---| '"ADVANCE_TREE_GROWTH"'
---| '"READ"'
---| '"LOWER_SAIL"'
---| '"ATTACKPLANT"'
---| '"HEAL"'
---| '"PLANTREGISTRY_RESEARCH_FAIL"'
---| '"CONSTRUCT"'
---| '"UNPATCH"'
---| '"YOTB_STARTCONTEST"'
---| '"TELEPORT"'
---| '"FILL_OCEAN"'
---| '"ACTIVATE"'
---| '"ROW"'
---| '"JOIN"'
---| '"ROW_FAIL"'
---| '"PLAY"'
---| '"FEEDPLAYER"'
---| '"JUMPIN_MAP"'
---| '"USE_HEAVY_OBSTACLE"'
---| '"UNSADDLE"'
---| '"ROTATE_FENCE"'
---| '"TAKEITEM"'
---| '"MOUNT_PLANK"'
---| '"START_CHANNELCAST"'
---| '"UNPIN"'
---| '"ACTION_YMH_EAT_MARBLE"'
---| '"STOPUSINGITEM"'
---| '"LOWER_ANCHOR"'
---| '"UNLOCK"'
---| '"ATTUNE"'
---| '"EAT"'
---| '"SLEEPIN"'
---| '"SMOTHER"'
---| '"RAISE_ANCHOR"'
---| '"INTERACT_WITH"'
---| '"STORE"'
---| '"LOWER_SAIL_FAIL"'
---| '"DECORATEVASE"'
---| '"REMOTERESURRECT"'
---| '"LOWER_SAIL_BOOST"'
---| '"ADDCOMPOSTABLE"'
---| '"WATER_TOSS"'
---| '"MINE"'
---| '"FEED"'
---| '"COMMENT"'
---| '"BATHBOMB"'
---| '"DISMANTLE_POCKETWATCH"'
---| '"BLINK_MAP"'
---| '"WALKTO"'
---| '"TAPTREE"'
---| '"INSTALL"'
---| '"FAN"'
---| '"TACKLE"'
---| '"SET_HEADING"'
---| '"TILL"'
---| '"SING_FAIL"'
---| '"CASTAOE"'
---| '"STEER_BOAT"'
---| '"CREATE"'
---| '"GIVE_TACKLESKETCH"'
---| '"CHANGEIN"'
---| '"HALLOWEENMOONMUTATE"'
---| '"STOPUSINGMAGICTOOL"'
---| '"WRITE"'
---| '"RUMMAGE"'
---| '"UNHITCH"'
---| '"BOAT_CANNON_LOAD_AMMO"'
---| '"BRUSH"'
---| '"TERRAFORM"'
---| '"SADDLE"'
---| '"STOP_STEERING_BOAT"'
---| '"PLANTSOIL"'
---| '"REMOVE_FROM_TROPHYSCALE"'
---| '"RETRACT_PLANK"'
---| '"TOSS"'
---| '"BEGIN_QUEST"'
---| '"USEITEM"'
---| '"START_CARRAT_RACE"'
---| '"UNEQUIP"'
---| '"HAUNT"'
---| '"BLINK"'
---| '"ADDWETFUEL"'
---| '"CASTSUMMON"'
---| '"TELLSTORY"'
---| '"BAIT"'
---| '"HARVEST"'
---| '"WEIGH_ITEM"'
---| '"COMPARE_WEIGHABLE"'
---| '"BEDAZZLE"'
---| '"STARTCHANNELING"'
---| '"APPLYCONSTRUCTION"'
---| '"STOPCONSTRUCTION"'
---| '"PICKUP"'
---| '"CASTSPELL"'
---| '"POUR_WATER"'
---| '"OCEAN_TRAWLER_RAISE"'
---| '"OCEAN_FISHING_CATCH"'
---| '"BUNDLESTORE"'
---| '"LIFT_GYM_SUCCEED_PERFECT"'
---| '"HAIRBALL"'
---| '"DISMOUNT_PLANK"'
---| '"LIFT_GYM_FAIL"'
---| '"SEW"'
---| '"CATPLAYGROUND"'
---| '"UPGRADE"'
---| '"MOLEPEEK"'
---| '"MAKEMOLEHILL"'
---| '"COMMUNEWITHSUMMONED"'
---| '"LIFT_DUMBBELL"'
---| '"COMBINESTACK"'
---| '"MAKEBALLOON"'
---| '"STEAL"'
---| '"DRAW"'
---| '"TRAVEL"'
---| '"TOSS_MAP"'
---| '"DEPLOY"'
---| '"USEITEMON"'
---| '"TEACH"'
---| '"ASSESSPLANTHAPPINESS"'
---| '"REVIVE_CORPSE"'
---| '"BOAT_MAGNET_BEACON_TURN_ON"'
---| '"CHANGE_TACKLE"'
---| '"UNLOAD_WINCH"'
---| '"OCEAN_FISHING_REEL"'
---| '"PLANT"'
---| '"OCEAN_FISHING_CAST"'
---| '"OCEAN_FISHING_POND"'
---| '"MARK"'
---| '"CAST_SPELLBOOK"'
---| '"DISMOUNT"'
---| '"USEMAGICTOOL"'
---| '"ATTACK"'
