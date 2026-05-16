# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
data modify entity @s data.proj set value {speed:0.4, lifetime:15, damage:1, face_player:1, radius:3.5, height:1.5}
