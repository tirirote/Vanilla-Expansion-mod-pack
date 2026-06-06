# dungeons/sword/parry_success.mcfunction
# @s is the player who parried successfully

# Mark attacker so shared wave helpers attribute damage correctly
tag @s add vexp.attacker

# Quality Buff
function vexp:dungeons/states/glow_buffed

execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/states/glow_marked

# Cleanup and close parry window
tag @s remove vexp.attacker
scoreboard players set @s vexp.parry_timer 0
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

# Feedback
particle flash{color:-6488120} ~ ~1 ~ 0 0 0 0 0
particle glow ~ ~1 ~ 0.25 0.25 0.25 0.1 3
particle glow_squid_ink ~ ~1 ~ 0.25 0.25 0.25 0.1 5
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.1, 0.1], finalColor: [0.4, 0.8, 0.65], scale: 1.7, dX: .25, dY: .25, dZ: .25, speed: 1, count: 3}

function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
