# Behaviour tick for custom mobs
# @s is the custom mob

# 0. Custom mob tick
execute if block ^ ^ ^1 #replaceable unless entity @s[tag=vexp.mob_trying_to_pickup] unless entity @s[tag=vexp.mob_aggro] run function vexp:custom_mobs/behaviour/wrapper_tick with entity @s data.vexp.mob

# 1. Custom ambient hook
execute store result score @s vexp.mob_idle_time run random value 0..100
execute if score @s vexp.mob_idle_time matches 1 run function vexp:custom_mobs/behaviour/ambient_wrapper with entity @s data.vexp.mob

# Custom hunt for other mobs (if can_hunt:1)
# 1. Find mob favorite targets
execute if entity @s[tag=vexp.mob_can_hunt] unless entity @s[tag=vexp.mob_trying_to_pickup] run function vexp:custom_mobs/behaviour/hunt_wrapper with entity @s data.vexp.mob

# 2. Fallback for the target
execute unless entity @s[tag=vexp.mob_can_hunt] unless entity @s[tag=vexp.mob_trying_to_pickup] as @p[distance=..12] unless entity @s[tag=vexp.mob_player_with_fav_item] unless entity @s[tag=vexp.mob_target] run tag @s add vexp.mob_target
execute unless entity @s[tag=vexp.mob_can_hunt] unless entity @s[tag=vexp.mob_trying_to_pickup] as @p[distance=12..] if entity @s[tag=vexp.mob_target] run tag @s remove vexp.mob_target

# Custom aggro (if hostile:1)
# 1. Manual aggro if mob is hostile via tags and hook (distance based)
execute if entity @s[tag=vexp.mob_is_hostile] unless entity @s[tag=vexp.mob_aggro] unless entity @s[tag=vexp.mob_trying_to_pickup] unless entity @s[tag=vexp.mob_got_item] unless entity @s[tag=vexp.mob_special_ready] unless entity @s[tag=vexp.mob_attack_ready] if entity @e[tag=vexp.mob_target,tag=!vexp.mob_player_with_fav_item,distance=..12,limit=1] run tag @s add vexp.mob_aggro

# 1. Trigger aggro wrapper when not hitted
execute if entity @s[tag=vexp.mob_aggro] if entity @s[nbt={HurtTime:0s}] run function vexp:custom_mobs/behaviour/aggro_wrapper with entity @s data.vexp.mob

# 3. Native aggro for angry mobs (By linking target UUID) (wolfs only)
execute unless entity @s[tag=vexp.mob_attack_done] unless entity @s[tag=vexp.mob_got_item] unless data entity @s angry_at run data modify entity @s angry_at set from entity @e[tag=vexp.mob_target,sort=nearest,limit=1] UUID

# Custom item pickup logic when close to item (if can_pickup_item:1)
# 1. Try to pick item
execute if entity @s[tag=vexp.mob_can_pickup] unless data entity @s equipment.mainhand run function vexp:custom_mobs/behaviour/item_pickup_wrapper with entity @s data.vexp.mob
execute if entity @s[tag=vexp.mob_can_pickup] unless entity @s[tag=vexp.mob_got_item] if data entity @s equipment.mainhand run tag @s add vexp.mob_got_item

# 2. When holding item custom wrapper
execute if entity @s[tag=vexp.mob_got_item] run function vexp:custom_mobs/behaviour/holding_item_wrapper with entity @s data.vexp.mob

# 3. Can eat item custom wrapper (if can_eat_item:1)
execute if entity @s[tag=vexp.mob_got_item] if entity @s[tag=vexp.mob_can_eat] run function vexp:custom_mobs/behaviour/eating_wrapper with entity @s data.vexp.mob

# Hurt management
# 1. Hurt custom wrapper
execute if entity @s[nbt=!{HurtTime:0s}] run function vexp:custom_mobs/behaviour/hurt_wrapper with entity @s data.vexp.mob
execute if entity @s[tag=vexp.mob_hurt_visual_swapped,nbt={HurtTime:0s}] run function vexp:custom_mobs/behaviour/hurt_restore_wrapper

# Attack triggers
# 1. Special attack wrapper
execute if entity @s[nbt={HurtTime:0s}] unless entity @s[tag=vexp.mob_trying_to_pickup] unless entity @s[tag=vexp.mob_got_item] unless entity @s[tag=vexp.mob_special_done] if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable run function vexp:custom_mobs/behaviour/special_attack_try with entity @s data.vexp.mob
# 2. Normal attack wrapper
execute if entity @s[nbt={HurtTime:0s}] unless entity @s[tag=vexp.mob_trying_to_pickup] unless entity @s[tag=vexp.mob_got_item] unless entity @s[tag=vexp.mob_attack_done] if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable run function vexp:custom_mobs/behaviour/attack_try with entity @s data.vexp.mob

# Attack Cooldown management
# Process Cooldown only when the mob has succesfully performed the attack
execute if score @s vexp.mob_cooldown matches 1.. run scoreboard players remove @s vexp.mob_cooldown 1
execute if score @s vexp.mob_special_cooldown matches 1.. run scoreboard players remove @s vexp.mob_special_cooldown 1

execute if entity @s[tag=vexp.mob_special_done] if score @s vexp.mob_special_cooldown matches 1.. run tag @s remove vexp.mob_special_ready
execute if entity @s[tag=vexp.mob_attack_done] if score @s vexp.mob_cooldown matches 1.. run tag @s remove vexp.mob_attack_ready

execute if entity @s[tag=vexp.mob_special_done] if score @s vexp.mob_special_cooldown matches 0 run tag @s remove vexp.mob_special_done
execute if entity @s[tag=vexp.mob_attack_done] if score @s vexp.mob_cooldown matches 0 run tag @s remove vexp.mob_attack_done

# Other data cleanup
execute if data entity @s Tame run data remove entity @s Tame
execute if data entity @s Owner run data remove entity @s Owner
execute if data entity @s InLove run data remove entity @s InLove
execute if data entity @s LoveCause run data remove entity @s LoveCause
execute if data entity @s Sitting run data remove entity @s Sitting
execute if data entity @s EggLayTime run data modify entity @s EggLayTime set value 10000
