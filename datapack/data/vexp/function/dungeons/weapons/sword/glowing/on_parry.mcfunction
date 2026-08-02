# Sword on parry hook
# @s is the player who parried successfully

# Mark attacker so shared wave helpers attribute damage correctly
tag @s add vexp.attacker

# Quality Buff
function vexp:dungeons/states/glow_buffed

execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/states/glow_marked
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

# Cleanup and close parry window
tag @s remove vexp.attacker
scoreboard players set @s vexp.parry_timer 0
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/aeo_waves/glowing
function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player", pitch:1}
