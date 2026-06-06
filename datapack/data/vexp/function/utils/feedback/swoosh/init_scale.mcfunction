# utils/feedback/swoosh/init_scale.mcfunction
# @s is a newly spawned item_display with data.swoosh payload.
# Applies initial scale = payload scale uniformly in all axes.

scoreboard players set #swoosh_scale100 vexp.math 100
execute store result score #swoosh_scale100 vexp.math run data get entity @s data.swoosh.scale 100

scoreboard players operation #swoosh_sx vexp.math = #swoosh_scale100 vexp.math
scoreboard players operation #swoosh_sy vexp.math = #swoosh_scale100 vexp.math
scoreboard players operation #swoosh_sz vexp.math = #swoosh_scale100 vexp.math

data modify storage vexp:temp swoosh.scale set value [1.0f,1.0f,1.0f]
execute store result storage vexp:temp swoosh.scale[0] float 0.01 run scoreboard players get #swoosh_sx vexp.math
execute store result storage vexp:temp swoosh.scale[1] float 0.01 run scoreboard players get #swoosh_sy vexp.math
execute store result storage vexp:temp swoosh.scale[2] float 0.01 run scoreboard players get #swoosh_sz vexp.math

data modify entity @s transformation.scale set from storage vexp:temp swoosh.scale
