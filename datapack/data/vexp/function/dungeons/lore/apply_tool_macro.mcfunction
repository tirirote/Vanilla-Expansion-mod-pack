# dungeons/lore/apply_tool_macro.mcfunction
# Called with storage vexp:temp lore_apply_tool

$item replace entity @s weapon.mainhand from entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"minecraft:lore":[{"text":"$(desc)","italic":false,"color":"dark_gray"},{"text":""},{"text":"• Eficiencia: ","italic":false,"color":"gray","extra":[{"text":"+$(efficiency)","italic":false,"color":"gold"}]},{"text":"• Daño: ","italic":false,"color":"gray","extra":[{"text":"+$(damage)","italic":false,"color":"gold"}]},{"text":"• Velocidad de ataque: ","italic":false,"color":"gray","extra":[{"text":"$(attack_speed)s","italic":false,"color":"white"}]}],"minecraft:custom_data":$(custom_data)}}
