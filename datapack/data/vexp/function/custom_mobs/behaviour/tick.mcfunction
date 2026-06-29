# Behaviour tick for custom mobs

# 1. Process Cooldown only when the mob has succesfully performed the attack
execute if score @s vexp.mob_cooldown matches 1.. run scoreboard players remove @s vexp.mob_cooldown 1
execute if entity @s[tag=vexp.mob_special_done] if score @s vexp.mob_cooldown matches 1.. run tag @s remove vexp.mob_special_ready
execute if entity @s[tag=vexp.mob_attack_done] if score @s vexp.mob_cooldown matches 1.. run tag @s remove vexp.attack_ready

execute if entity @s[tag=vexp.mob_special_done] if score @s vexp.mob_cooldown matches 0 run tag @s remove vexp.mob_special_done
execute if entity @s[tag=vexp.mob_attack_done] if score @s vexp.mob_cooldown matches 0 run tag @s remove vexp.mob_attack_done

# 2. Trigger special attack when player nearby
execute unless entity @s[tag=vexp.mob_special_done] run function vexp:custom_mobs/behaviour/special_attack_try with entity @s data.vexp.mob

# 3. Trigger second attack only when hitted
execute unless entity @s[tag=vexp.mob_attack_done] run function vexp:custom_mobs/behaviour/attack_try with entity @s data.vexp.mob

# 4. Link UUID for angry mobs
execute unless entity @s[tag=vexp.mob_attack_done] if data entity @s angry_at run data modify entity @s angry_at set from entity @p[distance=..12,limit=1,sort=arbitrary] UUID

# 5. If tame remove tame data
execute if data entity @s Tame run data modify entity @s Tame set value false

# 6. Custom mob tick
function vexp:custom_mobs/behaviour/wrapper_tick with entity @s data.vexp.mob

# 7. Custom ambient hook
execute store result score #custom_mob_random_ambient vexp.math run random value 0..100
execute if score #custom_mob_random_ambient vexp.math matches 1 run function vexp:custom_mobs/behaviour/ambient_wrapper with entity @s data.vexp.mob

# 8. Hurt custom hoook
execute if entity @s[nbt=!{HurtTime:0s}] run function vexp:custom_mobs/behaviour/hurt_wrapper with entity @s data.vexp.mob
