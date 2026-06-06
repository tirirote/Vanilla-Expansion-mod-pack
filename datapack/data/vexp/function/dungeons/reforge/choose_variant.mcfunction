# Reset mods and default variant payload.
data modify storage vexp:temp reforge_apply.mods set value {damage:0,cooldown:0,reach:0.0f,range:0.0f}
data modify storage vexp:temp reforge_apply.variant_name set value "Equilibrada"
data modify storage vexp:temp reforge_apply.variant_key set value "balanced"

# Roll 1..5.
execute store result score #rf_roll vexp.math run random value 1..5

# Route by stored reforged item type.
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{item_type:"sword"} run function vexp:dungeons/reforge/choose_sword
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{item_type:"axe"} run function vexp:dungeons/reforge/choose_axe
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{item_type:"bow"} run function vexp:dungeons/reforge/choose_bow
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{item_type:"dagger"} run function vexp:dungeons/reforge/choose_dagger
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{item_type:"scythe"} run function vexp:dungeons/reforge/choose_scythe
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{item_type:"spear"} run function vexp:dungeons/reforge/choose_spear
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{item_type:"gauntlets"} run function vexp:dungeons/reforge/choose_gauntlets
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{item_type:"rapier"} run function vexp:dungeons/reforge/choose_rapier


# Persist variant info in custom_data.
data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.variant_name set from storage vexp:temp reforge_apply.variant_name
data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.variant_key set from storage vexp:temp reforge_apply.variant_key
