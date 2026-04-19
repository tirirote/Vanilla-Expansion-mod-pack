# Called with storage vexp:temp reforge_apply {custom_data, variant_name}
$item replace entity @s weapon.mainhand from entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"minecraft:custom_data":$(custom_data),"minecraft:item_name":{"text":"$(variant_name) $(base_name)","italic":false},"minecraft:lore":[]}}
