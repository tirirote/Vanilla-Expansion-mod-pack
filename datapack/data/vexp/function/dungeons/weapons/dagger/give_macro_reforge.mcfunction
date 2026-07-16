# Give Dagger Macro
# Recibe $(item_id), $(name), $(model), $(material), $(quality), $(dmg), $(spd), $(combo_dmg), $(combo_cooldown), $(right_click_cooldown), $(combo_range), $(combo_reach), $(enchantments)

# Calculates interaction modifier (base 3.0). reach 1.5 -> -1.3 margin 0.2
# For simplicity, we hardcode -1.3 for common daggers.
# Netherite (reach 1.8) has -1.0 in its definition.
execute if score @s vexp.dummy matches 1 run return 0

$give @s $(item_id)[custom_data={vexp:{type:"mid_combo", item:"dagger", material:"$(material)", reforge:$(reforge), combo:$(combo)}}, item_name=$(name), custom_model_data={strings:["$(model)"]}, minecraft:enchantments=$(enchantments), minecraft:max_damage=$(max_damage), minecraft:damage=$(item_damage), attribute_modifiers=[{type:attack_damage, amount:-1.0f, operation:add_value, id:"vexp:dagger_damage", slot:mainhand}, {type:attack_speed, amount:$(spd), operation:add_value, id:"vexp:dagger_speed", slot:mainhand}, {type:entity_interaction_range, amount:-1, operation:add_value, id:"vexp:dagger_reach", slot:mainhand}, {type:block_interaction_range, amount:-1, operation:add_value, id:"vexp:dagger_block_reach", slot:mainhand}], minecraft:repairable={items:$(repair_material)}, minecraft:tooltip_display={hidden_components:["minecraft:attribute_modifiers"]},consumable={"animation":"bow", "consume_seconds":999999, "has_consume_particles":false}] 1
