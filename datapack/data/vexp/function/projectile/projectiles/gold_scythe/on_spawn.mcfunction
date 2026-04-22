# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
data modify entity @s data.proj set value {speed:0.6, lifetime:30, gravity:0, damage:2, randomness:0.15, homing_distance:3.5}
