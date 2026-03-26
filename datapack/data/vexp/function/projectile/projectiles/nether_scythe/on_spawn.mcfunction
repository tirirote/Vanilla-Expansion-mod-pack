# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
data modify entity @s data.proj set value {speed:0.2, lifetime:40, gravity:1, damage:1, randomness:0.15, homing_distance:3.0}
