# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
data modify entity @s data.proj set value {speed:0.6, lifetime:80, gravity:0, damage:5, randomness:0.1, homing_distance:6,exclude_tag:"nether_marked"}
