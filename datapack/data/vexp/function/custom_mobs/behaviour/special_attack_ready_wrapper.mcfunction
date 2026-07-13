# Execute special attack when player in range
# @s is the custom mob

# 2. Store random chance of attack
$execute store result score #mob_attack_chance vexp.math run random value 0..$(special_chance)

# 3. On special attack custom hook
$execute if score #mob_attack_chance vexp.math matches 1 run function vexp:custom_mobs/mobs/$(type)/on_special_attack

$scoreboard players set #mob_special_damage vexp.math $(special_damage)

# On Hit Fallback (step based)
# Step 1
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step1) as @e[tag=vexp.mob_target,distance=..1.5,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/$(type)/on_special_hit_target
$execute if score #mob_special_damage vexp.math matches 1.. if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step1) run damage @e[tag=vexp.mob_target,distance=..1.5,sort=nearest,limit=1] $(special_damage) minecraft:mob_attack by @s

# Step 2
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step2) as @e[tag=vexp.mob_target,distance=..1.5,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/$(type)/on_special_hit_target
$execute if score #mob_special_damage vexp.math matches 1.. if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step2) run damage @e[tag=vexp.mob_target,distance=..1.5,sort=nearest,limit=1] $(special_damage) minecraft:mob_attack by @s

# Step 3
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step3) as @e[tag=vexp.mob_target,distance=..1.5,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/$(type)/on_special_hit_target
$execute if score #mob_special_damage vexp.math matches 1.. if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step3) run damage @e[tag=vexp.mob_target,distance=..1.5,sort=nearest,limit=1] $(special_damage) minecraft:mob_attack by @s

# Step 4
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step4) as @e[tag=vexp.mob_target,distance=..1.5,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/$(type)/on_special_hit_target
$execute if score #mob_special_damage vexp.math matches 1.. if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range_step4) run damage @e[tag=vexp.mob_target,distance=..1.5,sort=nearest,limit=1] $(special_damage) minecraft:mob_attack by @s

# 4. On player_hit
$execute if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range) as @e[tag=vexp.mob_target,distance=..1.5,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/$(type)/on_special_hit_target
$execute if score #mob_special_damage vexp.math matches 1.. if score #mob_attack_chance vexp.math matches 1 positioned ^ ^ ^$(special_range) run damage @e[tag=vexp.mob_target,distance=..1.5,sort=nearest,limit=1] $(special_damage) minecraft:mob_attack by @s

# 6. Tag when attack done
execute if score #mob_attack_chance vexp.math matches 1 run tag @s add vexp.mob_special_done

# 7. Setup cooldown only when custom attack done
execute if entity @s[tag=vexp.mob_special_done] store result score @s vexp.mob_special_cooldown run data get entity @s data.vexp.mob.special_cooldown
