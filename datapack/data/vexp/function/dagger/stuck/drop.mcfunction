# Drop Stuck Dagger
# Ejecutado AS @s (marker) AT @s

# Soltar el item
summon item ~ ~ ~ {Item:{id:"minecraft:iron_sword",count:1,components:{"minecraft:custom_data":{vexp:{type:"dagger"}}, "minecraft:custom_model_data":{strings:["vexp:iron_dagger"]  }, "minecraft:attribute_modifiers":[{type:attack_damage, amount:-2.0, operation:add_value, id:"vexp:dagger_damage", slot:mainhand}, {type:attack_speed, amount:3.0, operation:add_value, id:"vexp:dagger_speed", slot:mainhand}], "minecraft:food":{nutrition:0, saturation:0.0f, can_always_eat:true}, "minecraft:consumable":{consume_seconds:0.1f, animation:"eat"}}}}

# Sonido
playsound minecraft:block.metal.hit player @a ~ ~ ~ 1 1

# Limpiar entidades vinculadas
execute as @e[tag=vexp.dagger_stuck_visual] if score @s vexp.id = @p[tag=vexp.dagger_stuck,limit=1] vexp.id run kill @s
execute as @e[tag=vexp.dagger_stuck_interact] if score @s vexp.id = @p[tag=vexp.dagger_stuck,limit=1] vexp.id run kill @s
kill @s
