# projectile/deflect_reverse_motion.mcfunction
# @s is the projectile entity to deflect.
# Invert motion vector and, when present, also invert fireball power vector.

scoreboard players set #neg vexp.math -1

execute store result score #deflect_mx vexp.math run data get entity @s Motion[0] 1000
execute store result score #deflect_my vexp.math run data get entity @s Motion[1] 1000
execute store result score #deflect_mz vexp.math run data get entity @s Motion[2] 1000
scoreboard players operation #deflect_mx vexp.math *= #neg vexp.math
scoreboard players operation #deflect_my vexp.math *= #neg vexp.math
scoreboard players operation #deflect_mz vexp.math *= #neg vexp.math
execute store result entity @s Motion[0] double 0.001 run scoreboard players get #deflect_mx vexp.math
execute store result entity @s Motion[1] double 0.001 run scoreboard players get #deflect_my vexp.math
execute store result entity @s Motion[2] double 0.001 run scoreboard players get #deflect_mz vexp.math

tag @s add vexp.parry_deflected
particle sweep_attack ~ ~ ~ 0 0 0 0 1
