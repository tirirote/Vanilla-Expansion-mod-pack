# Assign custom id.
execute unless score @s vexp.id = @s vexp.id run function vexp:utils/assign_id

scoreboard players set @s vexp.mob_cooldown 100
scoreboard players set @s vexp.mob_special_cooldown 100

#Assign custom tag.
tag @s add vexp.custom_mob

# Mob can hunt
execute store result score #mob_can_hunt vexp.math run data get entity @s data.vexp.mob.can_hunt
execute if score #mob_can_hunt vexp.math matches 1.. run tag @s add vexp.mob_can_hunt

# Mob is hostile
execute store result score #mob_is_hostile vexp.math run data get entity @s data.vexp.mob.is_hostile
execute if score #mob_is_hostile vexp.math matches 1.. run tag @s add vexp.mob_is_hostile

# Mob can pickup item
execute store result score #mob_can_pickup vexp.math run data get entity @s data.vexp.mob.can_pickup_item
execute if score #mob_can_pickup vexp.math matches 1.. run tag @s add vexp.mob_can_pickup

# Mob can eat item
execute store result score #mob_can_eat vexp.math run data get entity @s data.vexp.mob.can_eat_item
execute if score #mob_can_eat vexp.math matches 1.. run tag @s add vexp.mob_can_eat

# Mob Attack Range Setup
execute store result score #mob_special_range vexp.math run data get entity @s data.vexp.mob.special_range
execute store result score #mob_range vexp.math run data get entity @s data.vexp.mob.range

scoreboard players set #half_step vexp.math 2
scoreboard players set #100 vexp.math 100
scoreboard players operation #mob_special_range vexp.math *= #100 vexp.math
scoreboard players operation #mob_range vexp.math *= #100 vexp.math

# Mob Attack Range Steps
#Attack Range First step
scoreboard players operation #mob_range_step1 vexp.math = #mob_range vexp.math
scoreboard players operation #mob_range_step1 vexp.math /= #half_step vexp.math

#Attack Range Second step
scoreboard players operation #mob_range_step2 vexp.math = #mob_range vexp.math
scoreboard players operation #mob_range_step2 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_range_step2 vexp.math /= #half_step vexp.math

#Attack Range Third step
scoreboard players operation #mob_range_step3 vexp.math = #mob_range vexp.math
scoreboard players operation #mob_range_step3 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_range_step3 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_range_step3 vexp.math /= #half_step vexp.math

#Attack Range Fourth step
scoreboard players operation #mob_range_step4 vexp.math = #mob_range vexp.math
scoreboard players operation #mob_range_step4 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_range_step4 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_range_step4 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_range_step4 vexp.math /= #half_step vexp.math

#Mob Special Attack Range Steps
#Special Range First step
scoreboard players operation #mob_special_range_step1 vexp.math = #mob_special_range vexp.math
scoreboard players operation #mob_special_range_step1 vexp.math /= #half_step vexp.math

#Special Range Second step
scoreboard players operation #mob_special_range_step2 vexp.math = #mob_special_range vexp.math
scoreboard players operation #mob_special_range_step2 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_special_range_step2 vexp.math /= #half_step vexp.math

#Special Range Third step
scoreboard players operation #mob_special_range_step3 vexp.math = #mob_special_range vexp.math
scoreboard players operation #mob_special_range_step3 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_special_range_step3 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_special_range_step3 vexp.math /= #half_step vexp.math

#Special Range Fourth step
scoreboard players operation #mob_special_range_step4 vexp.math = #mob_special_range vexp.math
scoreboard players operation #mob_special_range_step4 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_special_range_step4 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_special_range_step4 vexp.math /= #half_step vexp.math
scoreboard players operation #mob_special_range_step4 vexp.math /= #half_step vexp.math

#Store special range step values
execute store result entity @s data.vexp.mob.special_range_step1 float 0.01 run scoreboard players get #mob_special_range_step1 vexp.math
execute store result entity @s data.vexp.mob.special_range_step2 float 0.01 run scoreboard players get #mob_special_range_step2 vexp.math
execute store result entity @s data.vexp.mob.special_range_step3 float 0.01 run scoreboard players get #mob_special_range_step3 vexp.math
execute store result entity @s data.vexp.mob.special_range_step4 float 0.01 run scoreboard players get #mob_special_range_step4 vexp.math

#Store attack range step values
execute store result entity @s data.vexp.mob.range_step1 float 0.01 run scoreboard players get #mob_range_step1 vexp.math
execute store result entity @s data.vexp.mob.range_step2 float 0.01 run scoreboard players get #mob_range_step2 vexp.math
execute store result entity @s data.vexp.mob.range_step3 float 0.01 run scoreboard players get #mob_range_step3 vexp.math
execute store result entity @s data.vexp.mob.range_step4 float 0.01 run scoreboard players get #mob_range_step4 vexp.math

#Set up custom attributes
function vexp:custom_mobs/setup_attributes with entity @s data.vexp.mob
