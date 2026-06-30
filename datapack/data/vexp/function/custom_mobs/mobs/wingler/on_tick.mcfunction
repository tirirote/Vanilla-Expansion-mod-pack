# On tick hook
# @s is the custom mob
# Particle feeback
execute store result score @s vexp.rand run random value 0..100
execute if data entity @s EggLayTime run data modify entity @s EggLayTime set value 10000
