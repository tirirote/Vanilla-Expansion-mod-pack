# dungeons/sword/parry_success.mcfunction
# @s is the player who parried successfully

# Mark attacker so shared wave helpers attribute damage correctly
tag @s add vexp.attacker

# Quality Buff
function vexp:dungeons/states/echo_buffed

execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/states/echo_marked
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

#TP Player behind mob
execute as @e[tag=vexp.parried,tag=vexp.echo_marked,predicate=vexp:is_target,distance=..12,limit=1] facing entity @p[tag=vexp.attacker,limit=1] feet positioned ~ ~.5 ~ if block ^ ^ ^-3.5 #replaceable run tp @p[tag=vexp.attacker,limit=1] ^ ^ ^-3.5 facing entity @s

# Cleanup and close parry window
tag @s remove vexp.attacker
scoreboard players set @s vexp.parry_timer 0
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/aeo_waves/echo
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player", pitch:1}
