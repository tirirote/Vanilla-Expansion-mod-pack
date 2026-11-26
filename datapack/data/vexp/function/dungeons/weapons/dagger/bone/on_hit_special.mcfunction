# Dagger on hit special hook
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:1.5, y:0.2}

# Foward dash
execute as @p[tag=vexp.attacker] at @s positioned ~ ~1 ~ if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^1
execute as @p[tag=vexp.attacker] at @s positioned ~ ~1 ~ if block ^ ^ ^2 #replaceable run tp @s ^ ^ ^2

# Feedback
$execute as @p[tag=vexp.attacker] at @s positioned ~ ~1 ~ positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/bone_hit

# Remove tag
execute as @p[tag=vexp.attacker] if entity @s[tag=vexp.hitted.special] run tag @s remove vexp.hitted.special
