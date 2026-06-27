# dungeons/sword/parry_success.mcfunction
# @s is the player who parried successfully

# Mark attacker so shared wave helpers attribute damage correctly
tag @s add vexp.attacker

# Quality Buff
function vexp:dungeons/states/nether_buffed

execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/states/nether_marked
# AoE wave against nearby valid targets
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/weapons/sword/netherite/wave

# Cleanup and close parry window
tag @s remove vexp.attacker
scoreboard players set @s vexp.parry_timer 0
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

# Feedback
particle flash{color:-26073} ~ ~1 ~ 0 0 0 0 0
particle flame ~ ~1 ~ .5 .5 .5 0.1 3
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
