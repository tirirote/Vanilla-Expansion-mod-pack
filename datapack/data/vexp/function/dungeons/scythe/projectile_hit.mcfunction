# dungeons/scythe/projectile_hit.mcfunction
# @s is the projectile marker

# Damage and slowness on impact target.
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..1.2,limit=1,sort=nearest] run damage @s 6 minecraft:magic
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..1.2,limit=1,sort=nearest] run effect give @s minecraft:slowness 3 1 true

# Impact feedback and cleanup.
particle minecraft:explosion ~ ~ ~ 0.15 0.15 0.15 0.05 1
function vexp:utils/sound {sound: "minecraft:item.trident.hit", type: "player"}
kill @s
