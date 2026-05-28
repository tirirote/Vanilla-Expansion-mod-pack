# Lifesteal I/II: grant regeneration to attacker on hit.

execute if score #ench_lifesteal vexp.math matches 1 run effect give @s minecraft:regeneration 5 0 true
execute if score #ench_lifesteal vexp.math matches 2.. run effect give @s minecraft:regeneration 5 1 true

execute as @e[tag=vexp.hitted] at @s run function vexp:utils/fx/health_steal

#Feedback
particle instant_effect{color:11147838,power:-1} ~ ~ ~ 0.5 0.2 0.5 0 5
particle entity_effect{color:-1855125967} ~ ~1 ~ 0.5 0.25 0.5 0 10
function vexp:utils/sound {sound: "minecraft:entity.vex.hurt", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.fox.bite", type: "player"}
