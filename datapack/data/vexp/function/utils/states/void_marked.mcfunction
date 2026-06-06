#Ejecutar estados según las tags de la entidad
#Fire already baked in-game
execute as @e[tag=vexp.state.blinded] at @s run function vexp:utils/states/blinded
execute as @e[tag=vexp.state.weaked] at @s run function vexp:utils/states/weaked
execute as @e[tag=vexp.state.freezed] at @s run function vexp:utils/states/freezed
execute as @e[tag=vexp.state.poisoned] at @s run function vexp:utils/states/poisoned
execute as @a[tag=vexp.state.gauntlets_guard,scores={vexp.gauntlets_guard=1..}] run attribute @s minecraft:knockback_resistance base set 2
execute as @a unless entity @s[tag=vexp.state.gauntlets_guard] run attribute @s minecraft:knockback_resistance base set 2
#Scoreboard
scoreboard players remove @e[scores={vexp.state=1..}] vexp.state 1
scoreboard players remove @a[scores={vexp.gauntlets_guard=1..}] vexp.gauntlets_guard 1
#Clear tags
tag @e[scores={vexp.state=..0}] remove vexp.state.blinded
tag @e[scores={vexp.state=..0}] remove vexp.state.weaked
tag @e[scores={vexp.state=..0}] remove vexp.state.freezed
tag @e[scores={vexp.state=..0}] remove vexp.state.poisoned
execute as @a[scores={vexp.gauntlets_guard=..0}] run attribute @s minecraft:knockback_resistance base set 0
tag @a[scores={vexp.gauntlets_guard=..0}] remove vexp.state.gauntlets_guard
