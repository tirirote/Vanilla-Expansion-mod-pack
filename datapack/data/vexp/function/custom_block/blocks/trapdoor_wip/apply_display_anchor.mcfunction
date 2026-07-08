# apply_display_anchor.mcfunction
# Ajusta anclaje del display; en half=top invierte scale Y para fijar bisagra visual.

scoreboard players operation #temp vexp.id = @s vexp.id

execute if data entity @s data.vexp{trap_half:"bottom"} as @e[type=item_display,tag=vexp.custom_block.display,distance=..2] if score @s vexp.id = #temp vexp.id run data modify entity @s transformation.translation set value [0f,0.045f,-0.435f]
execute if data entity @s data.vexp{trap_half:"bottom"} as @e[type=item_display,tag=vexp.custom_block.display,distance=..2] if score @s vexp.id = #temp vexp.id run data modify entity @s transformation.scale set value [1f,1f,1f]

execute if data entity @s data.vexp{trap_half:"top"} as @e[type=item_display,tag=vexp.custom_block.display,distance=..2] if score @s vexp.id = #temp vexp.id run data modify entity @s transformation.translation set value [0f,0.955f,-0.435f]
execute if data entity @s data.vexp{trap_half:"top"} as @e[type=item_display,tag=vexp.custom_block.display,distance=..2] if score @s vexp.id = #temp vexp.id run data modify entity @s transformation.scale set value [1f,-1f,1f]
