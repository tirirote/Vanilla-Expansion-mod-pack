# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
data modify entity @s data.proj set value {speed:0.8, lifetime:40, gravity:0, damage:0, randomness:0, homing_distance:2.5}
