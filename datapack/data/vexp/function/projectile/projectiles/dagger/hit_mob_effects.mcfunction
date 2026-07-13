# Projectile Hit Mob Effects
# Ejecutado AS @s (marker) AT @s

particle minecraft:enchanted_hit ~ ~ ~ 0.1 0.1 0.1 0.5 5
particle minecraft:damage_indicator ~ ~ ~ 0.2 0.2 0.2 0.25 3
function vexp:utils/sound {sound: "minecraft:item.trident.hit", type: "player", pitch:1}
