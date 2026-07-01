# drop.mcfunction
# Macro para generalizar la invocación del ítem que se va a soltar
# Input: $(id), $(wp_id), $(model), $(width), $(height), $(type), $(name), $(s_place), $(s_break), $(p_break)
$summon item ~ ~0.5 ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.custom_block.place"],data:{vexp:{id:"$(id)",wp_id:$(wp_id),model:"$(model)",width:$(width),height:$(height),type:"$(type)",name:"$(name)",s_place:"$(s_place)",s_break:"$(s_break)",p_break:"$(p_break)",scale:$(scale),y:$(y)}},Invisible:1b,Fixed:1b,Silent:1b},"minecraft:custom_model_data":{strings:["$(model)"]},"minecraft:item_name":{"text":"$(name)","italic":false}}}}

execute as @e[type=item,sort=nearest,distance=..1,limit=1] run function vexp:utils/motion/apply_random_motion {range:10, scale:0.01}
