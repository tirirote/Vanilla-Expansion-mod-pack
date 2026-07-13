# dungeons/gauntlets/on_hit.mcfunction
# @s is the target entity with vexp.hitted.special

#Mark target
function vexp:dungeons/states/echo_marked

#Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-2.5, y:-0.5}

#TP Player behind mob
execute as @e[tag=vexp.echo_marked,tag=vexp.hitted,predicate=vexp:is_target,distance=..12,limit=1] facing entity @p[tag=vexp.attacker,limit=1] feet positioned ~ ~.5 ~ if block ^ ^ ^-3.5 #replaceable run tp @p[tag=vexp.attacker,limit=1] ^ ^ ^-3.5 facing entity @s

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit

# Remove tag
execute as @p[tag=vexp.attacker,limit=1] if entity @s[tag=vexp.hitted.special] run tag @s remove vexp.hitted.special
