# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
data modify entity @s data.proj set value {speed:0.3, lifetime:40, gravity:0, damage:2, randomness:0.0, homing_distance:0.0}
