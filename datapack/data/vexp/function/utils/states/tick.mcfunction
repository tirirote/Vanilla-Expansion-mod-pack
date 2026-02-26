#Ejecutar estados según las tags de la entidad
#Fire already baked in-game
execute as @e[tag=vexp.state.blinded,scores={vexp.state=1..}] at @s run function vexp:utils/states/blinded
execute as @e[tag=vexp.state.weaked,scores={vexp.state=1..}] at @s run function vexp:utils/states/weaked
execute as @e[tag=vexp.state.freezed,scores={vexp.state=1..}] at @s run function vexp:utils/states/freezed
execute as @e[tag=vexp.state.poisoned,scores={vexp.state=1..}] at @s run function vexp:utils/states/poisoned
execute as @e[tag=vexp.state.slowed,scores={vexp.state=1..}] at @s run function vexp:utils/states/slowed

#Scoreboard
scoreboard players remove @e[scores={vexp.state=1..}] vexp.state 1
#Clear tags
tag @e[scores={vexp.state=..0}] remove vexp.state.blinded
tag @e[scores={vexp.state=..0}] remove vexp.state.weaked
tag @e[scores={vexp.state=..0}] remove vexp.state.freezed
tag @e[scores={vexp.state=..0}] remove vexp.state.poisoned
tag @e[scores={vexp.state=..0}] remove vexp.state.slowed