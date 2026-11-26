# Gauntlets on combo hook
# @s is the target entity

#Mark target
function vexp:dungeons/states/echo_marked

# Custom combo finisher
function vexp:dungeons/weapons/gauntlets/combo_finisher

# Feedback
$execute as @p[tag=vexp.attacker] at @s positioned ~ ~1 ~ positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/echo_hit
