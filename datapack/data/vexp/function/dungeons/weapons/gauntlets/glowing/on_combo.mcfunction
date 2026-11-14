# Gauntlets on combo hook
# @s is the target entity

# Mark mob
function vexp:dungeons/states/glow_marked

# Custom combo finisher
function vexp:dungeons/weapons/gauntlets/combo_finisher

# Visuals
$execute as @p[tag=vexp.attacker] at @s positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/glowing_hit
