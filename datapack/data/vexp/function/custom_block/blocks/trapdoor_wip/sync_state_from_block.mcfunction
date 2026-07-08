# sync_state_from_block.mcfunction
# Lee facing/half/open del bloque real y lo guarda en data.vexp.

execute if block ~ ~ ~ iron_trapdoor[facing=north] run data modify entity @s data.vexp.trap_facing set value "north"
execute if block ~ ~ ~ iron_trapdoor[facing=south] run data modify entity @s data.vexp.trap_facing set value "south"
execute if block ~ ~ ~ iron_trapdoor[facing=east] run data modify entity @s data.vexp.trap_facing set value "east"
execute if block ~ ~ ~ iron_trapdoor[facing=west] run data modify entity @s data.vexp.trap_facing set value "west"

execute if block ~ ~ ~ iron_trapdoor[half=top] run data modify entity @s data.vexp.trap_half set value "top"
execute if block ~ ~ ~ iron_trapdoor[half=bottom] run data modify entity @s data.vexp.trap_half set value "bottom"

execute if block ~ ~ ~ iron_trapdoor[open=true] run data modify entity @s data.vexp.trap_open set value 1b
execute if block ~ ~ ~ iron_trapdoor[open=false] run data modify entity @s data.vexp.trap_open set value 0b
