# Scythe on combo hook
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.2}

# Mark mob
function vexp:dungeons/states/nether_marked

# Buff
execute as @p[tag=vexp.attacker] run function vexp:dungeons/states/nether_buffed

# Feedback
$execute as @p[tag=vexp.attacker] at @s positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/netherite_hit

