# Execute attack if chance range triggered and not hurted
# @s is the custom mob

#1. On attack custom feedback hook
$function vexp:custom_mobs/mobs/$(type)/on_attack

$execute positioned ^ ^ ^$(range) as @e[tag=vexp.mob_target,distance=..1,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/$(type)/on_attack_hit_target
$execute positioned ^ ^ ^$(range_step1) as @e[tag=vexp.mob_target,distance=..1,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/$(type)/on_attack_hit_target
$execute positioned ^ ^ ^$(range_step2) as @e[tag=vexp.mob_target,distance=..1,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/$(type)/on_attack_hit_target
$execute positioned ^ ^ ^$(range_step3) as @e[tag=vexp.mob_target,distance=..1,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/$(type)/on_attack_hit_target
$execute positioned ^ ^ ^$(range_step4) as @e[tag=vexp.mob_target,distance=..1,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/$(type)/on_attack_hit_target

#2. Deal damage to player
$scoreboard players set #mob_attack_damage vexp.math $(damage)
$execute if score #mob_attack_damage vexp.math matches 1.. positioned ^ ^ ^$(range) run damage @e[tag=vexp.mob_target,distance=..1,sort=nearest,limit=1] $(damage) minecraft:mob_attack by @s
$execute if score #mob_attack_damage vexp.math matches 1.. positioned ^ ^ ^$(range_step1) run damage @e[tag=vexp.mob_target,distance=..1,sort=nearest,limit=1] $(damage) minecraft:mob_attack by @s
$execute if score #mob_attack_damage vexp.math matches 1.. positioned ^ ^ ^$(range_step2) run damage @e[tag=vexp.mob_target,distance=..1,sort=nearest,limit=1] $(damage) minecraft:mob_attack by @s
$execute if score #mob_attack_damage vexp.math matches 1.. positioned ^ ^ ^$(range_step3) run damage @e[tag=vexp.mob_target,distance=..1,sort=nearest,limit=1] $(damage) minecraft:mob_attack by @s
$execute if score #mob_attack_damage vexp.math matches 1.. positioned ^ ^ ^$(range_step4) run damage @e[tag=vexp.mob_target,distance=..1,sort=nearest,limit=1] $(damage) minecraft:mob_attack by @s

#3. Add tag when tried to attack
tag @s add vexp.mob_attack_done

#4. Setup cooldown only when custom attack done
execute if entity @s[tag=vexp.mob_attack_done] store result score @s vexp.mob_cooldown run data get entity @s data.vexp.mob.cooldown
