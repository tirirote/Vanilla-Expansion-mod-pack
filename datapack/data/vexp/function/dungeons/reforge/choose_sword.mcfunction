# 1: Templada
execute if score #rf_roll vexp.math matches 1 run data modify storage vexp:temp reforge_apply.variant_name set value "Templada"
execute if score #rf_roll vexp.math matches 1 run data modify storage vexp:temp reforge_apply.variant_key set value "damage"
execute if score #rf_roll vexp.math matches 1 run data modify storage vexp:temp reforge_apply.mods set value {damage:2,cooldown:4,reach:0.0f,range:0.0f}

# 2: Ligera
execute if score #rf_roll vexp.math matches 2 run data modify storage vexp:temp reforge_apply.variant_name set value "Ligera"
execute if score #rf_roll vexp.math matches 2 run data modify storage vexp:temp reforge_apply.variant_key set value "speed"
execute if score #rf_roll vexp.math matches 2 run data modify storage vexp:temp reforge_apply.mods set value {damage:-1,cooldown:-4,reach:0.0f,range:0.0f}

# 3: Noble
execute if score #rf_roll vexp.math matches 3 run data modify storage vexp:temp reforge_apply.variant_name set value "Noble"
execute if score #rf_roll vexp.math matches 3 run data modify storage vexp:temp reforge_apply.variant_key set value "balanced"
execute if score #rf_roll vexp.math matches 3 run data modify storage vexp:temp reforge_apply.mods set value {damage:0,cooldown:2,reach:1.0f,range:1.0f}

# 4: Mellada
execute if score #rf_roll vexp.math matches 4 run data modify storage vexp:temp reforge_apply.variant_name set value "Mellada"
execute if score #rf_roll vexp.math matches 4 run data modify storage vexp:temp reforge_apply.variant_key set value "bad"
execute if score #rf_roll vexp.math matches 4 run data modify storage vexp:temp reforge_apply.mods set value {damage:-1,cooldown:4,reach:-1.0f,range:0.0f}

# 5: Maestra
execute if score #rf_roll vexp.math matches 5 run data modify storage vexp:temp reforge_apply.variant_name set value "Maestra"
execute if score #rf_roll vexp.math matches 5 run data modify storage vexp:temp reforge_apply.variant_key set value "epic"
execute if score #rf_roll vexp.math matches 5 run data modify storage vexp:temp reforge_apply.mods set value {damage:2,cooldown:1,reach:0.5f,range:0.5f}
