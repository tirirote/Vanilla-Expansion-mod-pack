# On special attack feedback hook
# @s is the custom mob

execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.5,0.4,0.2], finalColor: [0.15, 0.1, 0.1], scale: 0.8, dX: 1, dY: 0.2, dZ: 1, speed: 1, count: 10}
particle instant_effect{color:4601380} ~ ~1 ~ 1 0.2 1 1 15
function vexp:utils/sound {sound: "minecraft:entity.phantom.death", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.evoker.cast_spell", type: "player"}

#Effects
execute as @e[type=#vexp:nightcrower_favorite_mobs,distance=..16] run effect give @s nausea 5 1 true
execute as @e[type=#vexp:nightcrower_favorite_mobs,distance=..16] run effect give @s blindness 5 0 true
execute as @e[type=#vexp:nightcrower_favorite_mobs,distance=..16] run effect give @s slowness 5 0 true

# Prevent sleeping
execute as @e[type=#vexp:nightcrower_favorite_mobs,distance=..16] run data remove entity @s Sleeping
execute as @e[type=#vexp:nightcrower_favorite_mobs,distance=..16] run data remove entity @s sleeping_pos
