# utils/feedback/swoosh/init_scale.mcfunction
# @s is a newly spawned item_display with data.swoosh payload.
# Applies initial scale = payload scale * (optional random variant).

scoreboard players set #swoosh_scale_rand vexp.math 0
scoreboard players set #swoosh_sx_pct vexp.math 100
scoreboard players set #swoosh_sy_pct vexp.math 100
scoreboard players set #swoosh_sz_pct vexp.math 100
scoreboard players set #swoosh_randflag vexp.math 0

execute store result score #swoosh_randflag vexp.math run data get entity @s data.swoosh.random_scale 1
execute if score #swoosh_randflag vexp.math matches 1.. store result score #swoosh_scale_rand vexp.math run random value 0..4

execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 0 run scoreboard players set #swoosh_sx_pct vexp.math 50
execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 0 run scoreboard players set #swoosh_sz_pct vexp.math 50

execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 1 run scoreboard players set #swoosh_sx_pct vexp.math 200
execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 1 run scoreboard players set #swoosh_sy_pct vexp.math 100
execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 1 run scoreboard players set #swoosh_sz_pct vexp.math 25

execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 2 run scoreboard players set #swoosh_sx_pct vexp.math 25
execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 2 run scoreboard players set #swoosh_sy_pct vexp.math 100
execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 2 run scoreboard players set #swoosh_sz_pct vexp.math 200

execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 3 run scoreboard players set #swoosh_sx_pct vexp.math 150
execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 3 run scoreboard players set #swoosh_sy_pct vexp.math 100
execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 3 run scoreboard players set #swoosh_sz_pct vexp.math 13

execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 4 run scoreboard players set #swoosh_sx_pct vexp.math 13
execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 4 run scoreboard players set #swoosh_sy_pct vexp.math 100
execute if score #swoosh_randflag vexp.math matches 1.. if score #swoosh_scale_rand vexp.math matches 4 run scoreboard players set #swoosh_sz_pct vexp.math 150

scoreboard players set #swoosh_scale100 vexp.math 100
execute store result score #swoosh_scale100 vexp.math run data get entity @s data.swoosh.scale 100

scoreboard players operation #swoosh_sx vexp.math = #swoosh_scale100 vexp.math
scoreboard players operation #swoosh_sx vexp.math *= #swoosh_sx_pct vexp.math
scoreboard players operation #swoosh_sx vexp.math /= #force_scale vexp.math

scoreboard players operation #swoosh_sy vexp.math = #swoosh_scale100 vexp.math
scoreboard players set #swoosh_sy vexp.math 100

scoreboard players operation #swoosh_sz vexp.math = #swoosh_scale100 vexp.math
scoreboard players operation #swoosh_sz vexp.math *= #swoosh_sz_pct vexp.math
scoreboard players operation #swoosh_sz vexp.math /= #force_scale vexp.math

data modify storage vexp:temp swoosh.scale set value [1.0f,1.0f,1.0f]
execute store result storage vexp:temp swoosh.scale[0] float 0.01 run scoreboard players get #swoosh_sx vexp.math
execute store result storage vexp:temp swoosh.scale[1] float 0.01 run scoreboard players get #swoosh_sy vexp.math
execute store result storage vexp:temp swoosh.scale[2] float 0.01 run scoreboard players get #swoosh_sz vexp.math

data modify entity @s transformation.scale set from storage vexp:temp swoosh.scale
