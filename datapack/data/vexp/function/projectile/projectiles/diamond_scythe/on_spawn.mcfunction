# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the diamond proj
data modify entity @s data.proj set value {speed:0.3, lifetime:20, damage:1, face_player:1, radius:4.5, height:1.5}
