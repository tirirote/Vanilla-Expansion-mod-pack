# Execute special attack when player in range
# @s is the custom mob

# 1. Mob waiting for attack
$function vexp:custom_mobs/mobs/$(type)/on_special_attack_waiting

# 2. Store random chance of attack
$execute store result score #mob_attack_chance vexp.math run random value 0..$(special_chance)

# 3. On special attack custom hook
$execute if score #mob_attack_chance vexp.math matches 1 run function vexp:custom_mobs/mobs/$(type)/on_special_attack

# On Hit Fallback (step based)
# Step 1
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step1) as @p[distance=..1.25] at @s run function vexp:custom_mobs/mobs/$(type)/on_special_hit_player
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step1) run damage @p[distance=..1.25] $(special_damage) generic by @s

# Step 2
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step2) as @p[distance=..1.25] at @s run function vexp:custom_mobs/mobs/$(type)/on_special_hit_player
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step2) run damage @p[distance=..1.25] $(special_damage) generic by @s

# Step 3
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step3) as @p[distance=..1.25] at @s run function vexp:custom_mobs/mobs/$(type)/on_special_hit_player
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step3) run damage @p[distance=..1.25] $(special_damage) generic by @s

# Step 4
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step4) as @p[distance=..1.25] at @s run function vexp:custom_mobs/mobs/$(type)/on_special_hit_player
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step4) run damage @p[distance=..1.25] $(special_damage) generic by @s

# 4. On player_hit
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range) as @p[distance=..1.25] at @s run function vexp:custom_mobs/mobs/$(type)/on_special_hit_player
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range) run damage @p[distance=..1.25] $(special_damage) generic by @s

# 6. Tag when attack done
execute if score #mob_attack_chance vexp.math matches 1 run tag @s add vexp.mob_special_done

# 7. Setup cooldown only when custom attack done
execute if entity @s[tag=vexp.mob_special_done] store result score @s vexp.mob_cooldown run data get entity @s data.vexp.mob.special_cooldown
