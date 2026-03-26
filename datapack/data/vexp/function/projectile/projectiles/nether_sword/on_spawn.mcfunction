# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
data modify entity @s data.proj set value {speed:0.05, lifetime:10, gravity:0, damage:2, randomness:0.05, homing_distance:0.0, radius:2.5,face_player:1}
