# Projectile setup for Shockwave enchantment.
# @s is the projectile entity.
data modify entity @s transformation.left_rotation set value [1.303f,0f,0f,0.707f]
data modify entity @s transformation.scale set value [3.4f,3.4f,1f]
#
data modify entity @s data.proj set value {speed:0.3, lifetime:9, damage:2, gravity:0.0, randomness:0.0, model:{strings:["vexp:shockwave"]}}
