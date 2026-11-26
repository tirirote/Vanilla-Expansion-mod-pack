# Bow on combo hook
# @s is the target entity

# Mark the target
function vexp:dungeons/states/glow_marked

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

# Player pushback
execute as @p[tag=vexp.attacker] at @s run function vexp:dungeons/weapons/bow/player_pushback

# Feedback
$execute as @p[tag=vexp.attacker] at @s positioned ~ ~1 ~ positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/glowing_hit
