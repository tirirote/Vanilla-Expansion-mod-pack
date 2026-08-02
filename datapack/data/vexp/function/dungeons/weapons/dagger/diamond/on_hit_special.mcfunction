# Dagger on hit special hook
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:1.5, y:0.1}

# Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/diamond_buffed

# Foward dash
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^1
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ if block ^ ^ ^2 #replaceable run tp @s ^ ^ ^2

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/diamond_hit

# Remove tag
execute as @p[tag=vexp.attacker,limit=1] if entity @s[tag=vexp.hitted.special] run tag @s remove vexp.hitted.special
