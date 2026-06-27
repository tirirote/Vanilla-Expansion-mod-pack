# dungeons/gauntlets/netherite/on_combo.mcfunction
# @s is the target entity

#Mark target
function vexp:dungeons/states/echo_marked

# Custom combo finisher
function vexp:dungeons/weapons/gauntlets/combo_finisher

#TP Player behind mob
execute as @e[tag=vexp.echo_marked,tag=vexp.hitted,predicate=vexp:is_target,distance=..12,limit=1] facing entity @p[tag=vexp.attacker,limit=1] feet positioned ~ ~.5 ~ if block ^ ^ ^-3.5 #replaceable run tp @p[tag=vexp.attacker,limit=1] ^ ^ ^-3.5 facing entity @s

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
