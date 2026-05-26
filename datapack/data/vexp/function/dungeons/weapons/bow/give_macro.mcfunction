# dungeons/bow/give_macro.mcfunction
# Params expected in storage vexp:dungeons.weapon/params:
# $(item_id), $(name), $(model), $(quality), $(combo_type), $(dmg), $(spd), $(combo_dmg), $(combo_cooldown), $(combo_range), $(combo_reach), $(max_damage), $(reach_mod)

execute if score @s vexp.dummy matches 1 run return 0

$give @s $(item_id)[custom_data={vexp:{type:"$(combo_type)", item:"bow", combo:{damage:$(combo_dmg), cooldown:$(combo_cooldown), right_click_cooldown:$(right_click_cooldown), range:$(combo_range), reach:$(combo_reach), quality:"$(quality)"}}}, item_name={"text":"$(name)","italic":false}, custom_model_data={strings:["$(model)"]}, minecraft:max_damage=$(max_damage), minecraft:damage=0, attribute_modifiers=[{type:attack_damage, amount:-1.0f, operation:add_value, id:"vexp:bow_damage", slot:mainhand}, {type:attack_speed, amount:$(spd), operation:add_value, id:"vexp:bow_speed", slot:mainhand}, {type:entity_interaction_range, amount:$(reach_mod), operation:add_value, id:"vexp:bow_reach", slot:mainhand}, {type:block_interaction_range, amount:$(reach_mod), operation:add_value, id:"vexp:bow_block_reach", slot:mainhand}], minecraft:tooltip_display={hidden_components:["minecraft:attribute_modifiers"]}] 1

