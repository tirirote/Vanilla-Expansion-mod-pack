# dungeons/axe/on_combo.mcfunction
# @s is the target entity (one of them)

#TP Player behind mob
execute as @e[tag=vexp.echo_marked,tag=vexp.hitted,predicate=vexp:is_target,distance=..12,limit=1] facing entity @p[tag=vexp.attacker,limit=1] feet positioned ~ ~.5 ~ if block ^ ^ ^-3.5 #replaceable run tp @p[tag=vexp.attacker,limit=1] ^ ^ ^-3.5 facing entity @s

#Mark mob
function vexp:dungeons/states/echo_marked

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

#Player buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
