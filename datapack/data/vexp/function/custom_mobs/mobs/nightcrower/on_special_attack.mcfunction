# On special attack feedback hook
# @s is the custom mob

particle instant_effect{color:7626051,power:1} ~ ~ ~ 1 0 1 1 15
particle instant_effect{color:4601380} ~ ~ ~ 1 0 1 1 5
function vexp:utils/sound {sound: "minecraft:entity.phantom.death", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.evoker.cast_spell", type: "player", pitch:1}

# Effects
execute as @e[type=#vexp:nightcrower_favorite_mobs,distance=..16] run effect give @s nausea 5 1 true
execute as @e[type=#vexp:nightcrower_favorite_mobs,distance=..16] run effect give @s blindness 5 0 true
execute as @e[type=#vexp:nightcrower_favorite_mobs,distance=..16] run effect give @s slowness 5 0 true

# Prevent sleeping
execute as @e[type=#vexp:nightcrower_favorite_mobs,distance=..16] run data remove entity @s Sleeping
execute as @e[type=#vexp:nightcrower_favorite_mobs,distance=..16] run data remove entity @s sleeping_pos
