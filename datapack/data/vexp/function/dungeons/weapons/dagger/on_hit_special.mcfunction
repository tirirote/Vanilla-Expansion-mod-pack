# dungeons/gauntlets/on_hit.mcfunction
# @s is the target entity with vexp.hitted.special

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:1.5, y:0.1}

# Foward dash
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^1
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ if block ^ ^ ^2 #replaceable run tp @s ^ ^ ^2

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit

# Remove tag
execute as @p[tag=vexp.attacker,limit=1] if entity @s[tag=vexp.hitted.special] run tag @s remove vexp.hitted.special
