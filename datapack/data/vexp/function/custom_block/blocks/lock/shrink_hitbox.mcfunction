data modify entity @s width set value 0.6f
data modify entity @s height set value 0.6f

execute if data entity @s data.vexp{target_type:"container"} at @s run tp @s ^ ^0.45 ^-0.55
execute if data entity @s data.vexp{target_type:"door"} at @s run tp @s ^ ^0.5 ^-0.25

tag @s remove vexp.lock_expanded
