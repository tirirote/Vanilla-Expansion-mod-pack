# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
data modify entity @s data.proj set value {speed:0.1, lifetime:120, gravity:0, damage:2, randomness:0.2, homing_distance:6.0}
