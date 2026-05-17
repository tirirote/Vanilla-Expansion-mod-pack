# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
execute store result score #vexp.random vexp.math run random value 0..1

execute if score #vexp.random vexp.math matches 0 run data modify entity @s data.proj set value {speed:0.12, lifetime:36, gravity:-0.2, damage:2, randomness:0.1, homing_distance:0.0, radius:0.5, height:1.0, spin:24}
execute if score #vexp.random vexp.math matches 1 run data modify entity @s data.proj set value {speed:0.12, lifetime:36, gravity:-0.2, damage:2, randomness:0.1, homing_distance:0.0, radius:0.5, height:1.0, spin:-24}
