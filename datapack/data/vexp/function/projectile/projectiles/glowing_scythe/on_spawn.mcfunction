# Inicialización del projectil
# @s es el projectil
data modify entity @s transformation.left_rotation set value [1f,0f,0f,1f]
data modify entity @s transformation.scale set value [3.4f,3.4f,1.7f]
data modify entity @s data.proj set value {speed:2.0, lifetime:14, damage:1, gravity:0.0, randomness:0.0, model:{strings:["vexp:glowing_scythe"]}}
