# Axe on combo hook
# @s is the target entity (one of them)

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

#Player buff
execute as @p[tag=vexp.attacker] run function vexp:dungeons/states/diamond_buffed

# Visual feedback
$execute as @p[tag=vexp.attacker] at @s positioned ~ ~1 ~ positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/diamond_hit
