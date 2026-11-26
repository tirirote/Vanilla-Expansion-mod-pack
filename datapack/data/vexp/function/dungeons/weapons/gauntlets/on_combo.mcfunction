# Gauntlets on combo hook
# @s is the target entity

# Custom combo finisher
function vexp:dungeons/weapons/gauntlets/combo_finisher

# Visuals
$execute as @p[tag=vexp.attacker] at @s positioned ~ ~1 ~ positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/strong_punch_hit
