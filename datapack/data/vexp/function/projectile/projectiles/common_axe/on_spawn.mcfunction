# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj

data modify entity @s data.proj set value {speed:0.8, lifetime:7, gravity:0.0, damage:4}
