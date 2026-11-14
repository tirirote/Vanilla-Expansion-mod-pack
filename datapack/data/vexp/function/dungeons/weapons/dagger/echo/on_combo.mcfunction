# Dagger on combo hook
# @s is the target entity

# Custom combo finisher
function vexp:dungeons/weapons/dagger/combo_finisher

# Mark mob
function vexp:dungeons/states/echo_marked

# Feedback
$execute as @p[tag=vexp.attacker] at @s positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/echo_hit
