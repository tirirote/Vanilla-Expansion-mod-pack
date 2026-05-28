# utils/feedback/swoosh/apply_scaled_stretch.mcfunction
# @s is item_display swoosh.
# Frame stretch uses base [1.7, 1.0, 1.7] multiplied by payload scale.

scoreboard players set #const_17 vexp.math 17
scoreboard players set #const_10 vexp.math 10

scoreboard players set #swoosh_scale100 vexp.math 100
execute store result score #swoosh_scale100 vexp.math run data get entity @s data.swoosh.scale 100

scoreboard players operation #swoosh_sx vexp.math = #swoosh_scale100 vexp.math
scoreboard players operation #swoosh_sx vexp.math *= #const_17 vexp.math
scoreboard players operation #swoosh_sx vexp.math /= #const_10 vexp.math

scoreboard players set #swoosh_sy vexp.math 100

scoreboard players operation #swoosh_sz vexp.math = #swoosh_scale100 vexp.math
scoreboard players operation #swoosh_sz vexp.math *= #const_17 vexp.math
scoreboard players operation #swoosh_sz vexp.math /= #const_10 vexp.math

data modify storage vexp:temp swoosh.scale set value [1.7f,1.0f,1.7f]
execute store result storage vexp:temp swoosh.scale[0] float 0.01 run scoreboard players get #swoosh_sx vexp.math
execute store result storage vexp:temp swoosh.scale[1] float 0.01 run scoreboard players get #swoosh_sy vexp.math
execute store result storage vexp:temp swoosh.scale[2] float 0.01 run scoreboard players get #swoosh_sz vexp.math

data modify entity @s transformation.scale set from storage vexp:temp swoosh.scale
