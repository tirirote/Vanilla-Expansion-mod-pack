# dungeons/sword/parry_success.mcfunction
# @s is the player who parried successfully

# Mark attacker so shared wave helpers attribute damage correctly
tag @s add vexp.attacker

# Quality Buff
function vexp:dungeons/states/diamond_buffed

# AoE wave against nearby valid targets
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/weapons/sword/diamond/wave

# Cleanup and close parry window
tag @s remove vexp.attacker
scoreboard players set @s vexp.parry_timer 0
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

# Feedback
execute positioned ~ ~ ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.8,0.8,0.8], finalColor: [0.9, 1.0, 1.0], scale: 1.7, dX: 0.2, dY: 0.0, dZ: 0.2, speed: 0.05, count: 3}
particle flash{color:-9145228} ~ ~ ~ 0.0 0.0 0.0 0 0
function vexp:utils/sound {sound: "minecraft:entity.wind_charge.wind_burst", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.nodamage", type: "player"}
