# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
data modify entity @s data.proj set value {speed:0.1, lifetime:120, gravity:0, damage:1, randomness:0.15, homing_distance:12.0}
