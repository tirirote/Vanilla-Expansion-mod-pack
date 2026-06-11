# Assign custom id.
execute unless score @s vexp.id = @s vexp.id run function vexp:utils/assign_id

#Assign custom tag.
tag @s add vexp.custom_mob

#Other Smart attributes

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
