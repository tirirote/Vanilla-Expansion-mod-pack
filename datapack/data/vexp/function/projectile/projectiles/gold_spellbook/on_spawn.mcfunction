# Inicialización del projectil
# @s es el projectil

#Random rot
execute store result score @s vexp.rand run random value 0..2
execute if score @s vexp.rand matches 0 run data modify entity @s transformation.left_rotation set value [0.707f,0.303f,0f,1f]
execute if score @s vexp.rand matches 1 run data modify entity @s transformation.left_rotation set value [0.707f,-0.303f,0f,1f]
execute if score @s vexp.rand matches 2 run data modify entity @s transformation.left_rotation set value [0.707f,0f,0f,1f]

data modify entity @s data.proj set value {speed:0.6, lifetime:90, damage:1, gravity:4.0, spin:6.0, homing_distance:6.0, randomness:0.1, model:{strings:["vexp:gold_spell"]}}
data modify entity @s Glowing set value true
data modify entity @s glow_color_override set value 16772484
