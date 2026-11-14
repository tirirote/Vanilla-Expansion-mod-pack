# Gauntlets special hit hook
# @s is the target entity

# Mark mob
function vexp:dungeons/states/glow_marked

#Buff
execute as @p[tag=vexp.attacker] run function vexp:dungeons/states/glow_buffed

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-2.5, y:-0.5}

# Visuals
$execute as @p[tag=vexp.attacker] at @s positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/glowing_hit

# Remove tag
execute as @p[tag=vexp.attacker] if entity @s[tag=vexp.hitted.special] run tag @s remove vexp.hitted.special
