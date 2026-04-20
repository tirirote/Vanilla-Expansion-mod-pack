# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
execute store result score #vexp.random vexp.math run random value 0..1

execute if score #vexp.random vexp.math matches 0 run data modify entity @s data.proj set value {speed:0.2, lifetime:10, gravity:-2, damage:2, randomness:0.0, homing_distance:0.0, radius:0.5, orbit_height:0.8, spin:36}
execute if score #vexp.random vexp.math matches 1 run data modify entity @s data.proj set value {speed:0.2, lifetime:10, gravity:-2, damage:2, randomness:0.0, homing_distance:0.0, radius:0.5, orbit_height:0.8, spin:-36}
