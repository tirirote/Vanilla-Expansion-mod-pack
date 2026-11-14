# Scythe on combo hook
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.2}

# Buff
execute as @p[tag=vexp.attacker] run function vexp:dungeons/states/gold_buffed

# Feedback
$execute as @p[tag=vexp.attacker] at @s positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/gold_hit
