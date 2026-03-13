# dungeons/sword_nether/projectile/on_spawn.mcfunction
# @s is the projectile

data modify entity @s data.proj set value {speed:0.95, lifetime:12, gravity:0, damage:1}
