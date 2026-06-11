# Execute attack if chance range triggered and not hurted
# @s is the custom mob

#1. On attack custom feedback hook
$function vexp:custom_mobs/mobs/$(type)/on_attack

$execute positioned ^ ^ ^$(range) as @p[distance=..1.25] at @s run function vexp:custom_mobs/mobs/$(type)/on_attack_hit_player
$execute positioned ^ ^ ^$(range_step1) as @p[distance=..1.25] at @s run function vexp:custom_mobs/mobs/$(type)/on_attack_hit_player
$execute positioned ^ ^ ^$(range_step2) as @p[distance=..1.25] at @s run function vexp:custom_mobs/mobs/$(type)/on_attack_hit_player
$execute positioned ^ ^ ^$(range_step3) as @p[distance=..1.25] at @s run function vexp:custom_mobs/mobs/$(type)/on_attack_hit_player
$execute positioned ^ ^ ^$(range_step4) as @p[distance=..1.25] at @s run function vexp:custom_mobs/mobs/$(type)/on_attack_hit_player

#2. Deal damage to player
$execute positioned ^ ^ ^$(range) run damage @p[distance=..1.25] $(damage) generic by @s
$execute positioned ^ ^ ^$(range_step1) run damage @p[distance=..1.25] $(damage) generic by @s
$execute positioned ^ ^ ^$(range_step2) run damage @p[distance=..1.25] $(damage) generic by @s
$execute positioned ^ ^ ^$(range_step3) run damage @p[distance=..1.25] $(damage) generic by @s
$execute positioned ^ ^ ^$(range_step4) run damage @p[distance=..1.25] $(damage) generic by @s

#3. Add tag when tried to attack
tag @s add vexp.mob_attack_done

#4. Setup cooldown only when custom attack done
execute if entity @s[tag=vexp.mob_attack_done] store result score @s vexp.mob_cooldown run data get entity @s data.vexp.mob.cooldown
