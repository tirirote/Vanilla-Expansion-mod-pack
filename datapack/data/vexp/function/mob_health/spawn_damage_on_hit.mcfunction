# @s is the hitted entity after damage has been applied
execute unless score @s vexp.hit_success matches 1.. run return 0

execute store result score #hp_new vexp.math run data get entity @s Health 100
scoreboard players operation #damage_raw vexp.math = @s vexp.old_hp
scoreboard players operation #damage_raw vexp.math -= #hp_new vexp.math

# Fallback: some hits are processed before Health reflects the damage in the same chain.
execute if score #damage_raw vexp.math matches ..0 store result score #damage_raw vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 100

data modify storage vexp:temp Damage.color set value "yellow"
data modify storage vexp:temp Damage.bold set value false
execute if entity @s[tag=vexp.hitted.combo_end] run data modify storage vexp:temp Damage.color set value "red"
execute if entity @s[tag=vexp.hitted.combo_end] run data modify storage vexp:temp Damage.bold set value true

execute if score #damage_raw vexp.math matches 1.. run scoreboard players operation #damage vexp.math = #damage_raw vexp.math
execute if score #damage_raw vexp.math matches 1.. run scoreboard players add #damage vexp.math 99
execute if score #damage_raw vexp.math matches 1.. run scoreboard players operation #damage vexp.math /= #force_scale vexp.math
execute if score #damage_raw vexp.math matches 1.. run function vexp:mob_health/spawn_damage
scoreboard players operation @s vexp.old_hp -= #damage_raw vexp.math
execute if score @s vexp.old_hp matches ..0 run scoreboard players set @s vexp.old_hp 0
