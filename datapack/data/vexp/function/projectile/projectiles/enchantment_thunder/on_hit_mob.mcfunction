tag @s add vexp.prevent_despawn

execute as @e[predicate=vexp:is_target,distance=..2.5] unless entity @s[tag=vexp.projectile_owner] at @s run function vexp:dungeons/states/thunder_stunned

particle electric_spark ~ ~ ~ 0.35 0.35 0.35 1 5
