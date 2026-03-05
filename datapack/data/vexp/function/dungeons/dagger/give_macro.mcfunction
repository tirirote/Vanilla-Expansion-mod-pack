# Give Dagger Macro
# Recibe $(item_id), $(name), $(model), $(dmg), $(spd), $(combo_dmg), $(combo_cooldown), $(combo_range), $(combo_reach)

# Calculates interaction modifier (base 3.0). reach 1.5 -> -1.3 margin 0.2
# For simplicity, we hardcode -1.3 for common daggers. 
# Netherite (reach 1.8) has -1.0 in its definition.
execute if score @s vexp.dummy matches 1 run return 0

$give @s $(item_id)[custom_data={vexp:{type:"short_combo", item:"dagger", combo:{damage:$(combo_dmg), cooldown:$(combo_cooldown), range:$(combo_range), reach:$(combo_reach)}}}, item_name={"text":"$(name)","italic":false}, lore=[{"text":"Arma arrojadiza y rápida","italic":false,"color":"gray"}, {"text":""}, {"text":"Stats de Combo:","italic":false,"color":"blue"}, {"text":"- Daño: $(combo_dmg)","italic":false,"color":"dark_gray"}, {"text":"- Alcance: $(combo_reach)","italic":false,"color":"dark_gray"}, {"text":"- Área (AoE): $(combo_range)","italic":false,"color":"dark_gray"}, {"text":"- Cooldown: $(combo_cooldown) ticks","italic":false,"color":"dark_gray"}], custom_model_data={strings:["$(model)"]}, attribute_modifiers=[{type:attack_damage, amount:$(dmg), operation:add_value, id:"vexp:dagger_damage", slot:mainhand}, {type:attack_speed, amount:$(spd), operation:add_value, id:"vexp:dagger_speed", slot:mainhand}, {type:entity_interaction_range, amount:-1.3, operation:add_value, id:"vexp:dagger_reach", slot:mainhand}, {type:block_interaction_range, amount:-1.3, operation:add_value, id:"vexp:dagger_block_reach", slot:mainhand}], food={nutrition:0, saturation:0.0f, can_always_eat:true}, consumable={consume_seconds:1000.0f, animation:"eat"}] 1
