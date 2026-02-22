# Projectile Hit Mob Effects
# Ejecutado AS @s (marker) AT @s

particle minecraft:crit ~ ~ ~ 0.1 0.1 0.1 0.5 15
particle minecraft:damage_indicator ~ ~ ~ 0.2 0.2 0.2 0.25 5
playsound minecraft:item.trident.hit_ground player @a[distance=..10] ~ ~ ~ 1 1
playsound minecraft:block.vault.fall player @a[distance=..10] ~ ~ ~ 1 1
