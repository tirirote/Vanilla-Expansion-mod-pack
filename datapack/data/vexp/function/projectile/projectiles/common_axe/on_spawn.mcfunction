# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
execute store result score #vexp.random vexp.math run random value 0..1

execute if score #vexp.random vexp.math matches 0 run data modify entity @s data.proj set value {speed:0.1, lifetime:24, gravity:-0.2, damage:1, radius:1.0, height:1.0, spin:28}
execute if score #vexp.random vexp.math matches 1 run data modify entity @s data.proj set value {speed:0.1, lifetime:24, gravity:-0.2, damage:1, radius:1.0, height:1.0, spin:-28}
