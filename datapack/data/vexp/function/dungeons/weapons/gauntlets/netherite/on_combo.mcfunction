# Gauntlets on combo hook
# @s is the target entity

#Mark target
function vexp:dungeons/states/nether_marked

# Custom combo finisher
function vexp:dungeons/weapons/gauntlets/combo_finisher

# Feedback
$execute as @p[tag=vexp.attacker] at @s positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/netherite_hit
