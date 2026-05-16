# dungeons/lore/apply_armor_macro_legs.mcfunction
# Called with storage vexp:temp lore_apply_armor

$item replace entity @s armor.legs from entity @s armor.legs {"function":"minecraft:set_components","components":{"minecraft:lore":[{"text":"$(desc)","italic":false,"color":"dark_gray"},{"text":""},{"text":"• Defensa: ","italic":false,"color":"gray","extra":[{"text":"+$(defense)","italic":false,"color":"gold"}]},{"text":"• Dureza: ","italic":false,"color":"gray","extra":[{"text":"+$(toughness)","italic":false,"color":"gold"}]},{"text":"• Resistencia al retroceso: ","italic":false,"color":"gray","extra":[{"text":"$(knockback_resistance)","italic":false,"color":"gold"}]},{"text":""}],"minecraft:custom_data":$(custom_data)}}
