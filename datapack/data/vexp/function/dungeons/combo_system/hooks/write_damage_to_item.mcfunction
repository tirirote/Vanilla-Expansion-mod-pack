# dungeons/combo_system/hooks/write_damage_to_item.mcfunction
# Called with storage vexp:temp durability {damage:<int>}

$item replace entity @s weapon.mainhand from entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"minecraft:damage":$(damage)}}
