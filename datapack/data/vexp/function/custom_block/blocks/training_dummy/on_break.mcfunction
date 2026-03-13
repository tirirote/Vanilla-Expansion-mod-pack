# on_break.mcfunction
# Remove the Dummy Husk that matches this block's ID
scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=slime,tag=vexp.custom_block.dummy] if score @s vexp.id = #temp vexp.id run kill @s
