# Behaviour tick for custom mobs

# 0. Custom mob tick
function vexp:custom_mobs/behaviour/wrapper_tick with entity @s data.vexp.mob

# 1. Process Cooldown only when the mob has succesfully performed the attack
execute if score @s vexp.mob_cooldown matches 1.. run scoreboard players remove @s vexp.mob_cooldown 1
execute if entity @s[tag=vexp.mob_special_done] if score @s vexp.mob_cooldown matches 1.. run tag @s remove vexp.mob_special_ready
execute if entity @s[tag=vexp.mob_attack_done] if score @s vexp.mob_cooldown matches 1.. run tag @s remove vexp.mob_attack_ready

execute if entity @s[tag=vexp.mob_special_done] if score @s vexp.mob_cooldown matches 0 run tag @s remove vexp.mob_special_done
execute if entity @s[tag=vexp.mob_attack_done] if score @s vexp.mob_cooldown matches 0 run tag @s remove vexp.mob_attack_done

# 2. Trigger special attack when player nearby
execute unless entity @s[tag=vexp.mob_special_done] unless entity @s[tag=vexp.mob_got_item] run function vexp:custom_mobs/behaviour/special_attack_try with entity @s data.vexp.mob

# 3. Trigger second attack only when hitted
execute unless entity @s[tag=vexp.mob_attack_done] unless entity @s[tag=vexp.mob_got_item] run function vexp:custom_mobs/behaviour/attack_try with entity @s data.vexp.mob

# 4. Link UUID for angry mobs
execute unless entity @s[tag=vexp.mob_attack_done] unless entity @s[tag=vexp.mob_got_item] if data entity @s angry_at run data modify entity @s angry_at set from entity @p[distance=..7,limit=1,sort=arbitrary] UUID

# 5. Manual aggro via tags and hook (distance based)
execute if entity @s[tag=vexp.mob_is_hostile] unless entity @s[tag=vexp.mob_aggro] unless entity @s[tag=vexp.mob_got_item] unless entity @s[tag=vexp.mob_special_ready] unless entity @s[tag=vexp.mob_attack_ready] if entity @p[distance=1.5..6,limit=1] run tag @s add vexp.mob_aggro
execute if entity @s[tag=vexp.mob_aggro] unless entity @p[distance=1.5..7,limit=1] run tag @s remove vexp.mob_aggro
execute if entity @s[tag=vexp.mob_aggro] if entity @s[nbt=!{HurtTime:10s}] run function vexp:custom_mobs/behaviour/aggro_wrapper with entity @s data.vexp.mob

# 6. Custom ambient hook
execute store result score @s vexp.mob_idle_time run random value 0..100
execute if score @s vexp.mob_idle_time matches 1 run function vexp:custom_mobs/behaviour/ambient_wrapper with entity @s data.vexp.mob

# 7. Hurt custom hoook
execute if entity @s[nbt=!{HurtTime:0s}] run function vexp:custom_mobs/behaviour/hurt_wrapper with entity @s data.vexp.mob

# 8. Custom item pickup logic when close to item
execute unless entity @s[tag=vexp.mob_aggro] if entity @s[tag=vexp.mob_can_pickup] unless data entity @s equipment.mainhand run function vexp:custom_mobs/behaviour/item_pickup_wrapper with entity @s data.vexp.mob
execute unless entity @s[tag=vexp.mob_got_item] if data entity @s equipment.mainhand run tag @s add vexp.mob_got_item

execute if entity @s[tag=vexp.mob_got_item] run function vexp:custom_mobs/behaviour/holding_item_wrapper with entity @s data.vexp.mob

# 9. Can eat item custom hook
execute if entity @s[tag=vexp.mob_got_item] if entity @s[tag=vexp.mob_can_eat] run function vexp:custom_mobs/behaviour/eating_wrapper with entity @s data.vexp.mob

# Safenes when buried inside a block
execute unless block ~ ~ ~ #replaceable if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.2 ~8 ~
execute unless block ~ ~ ~ #replaceable if block ^ ^ ^-1 #replaceable run tp @s ^ ^ ^0.2 ~-8 ~

# First Other data cleanup
execute if data entity @s Tame run data modify entity @s Tame set value false
execute if data entity @s InLove run data modify entity @s InLove set value false
execute if data entity @s EggLayTime run data modify entity @s EggLayTime set value 10000
