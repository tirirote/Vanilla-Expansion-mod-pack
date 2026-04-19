# 1: Rudo
execute if score #rf_roll vexp.math matches 1 run data modify storage vexp:temp reforge_apply.variant_name set value "Rudo"
execute if score #rf_roll vexp.math matches 1 run data modify storage vexp:temp reforge_apply.variant_key set value "damage"
execute if score #rf_roll vexp.math matches 1 run data modify storage vexp:temp reforge_apply.mods set value {damage:2,cooldown:3,reach:0.0f,range:0.0f}

# 2: Ligero
execute if score #rf_roll vexp.math matches 2 run data modify storage vexp:temp reforge_apply.variant_name set value "Ligero"
execute if score #rf_roll vexp.math matches 2 run data modify storage vexp:temp reforge_apply.variant_key set value "speed"
execute if score #rf_roll vexp.math matches 2 run data modify storage vexp:temp reforge_apply.mods set value {damage:-3,cooldown:-2,reach:0.0f,range:0.0f}

# 3: Contundente
execute if score #rf_roll vexp.math matches 3 run data modify storage vexp:temp reforge_apply.variant_name set value "Contundente"
execute if score #rf_roll vexp.math matches 3 run data modify storage vexp:temp reforge_apply.variant_key set value "balanced"
execute if score #rf_roll vexp.math matches 3 run data modify storage vexp:temp reforge_apply.mods set value {damage:1,cooldown:-1,reach:1.0f,range:0.0f}

# 4: Desgastado
execute if score #rf_roll vexp.math matches 4 run data modify storage vexp:temp reforge_apply.variant_name set value "Desgastado"
execute if score #rf_roll vexp.math matches 4 run data modify storage vexp:temp reforge_apply.variant_key set value "bad"
execute if score #rf_roll vexp.math matches 4 run data modify storage vexp:temp reforge_apply.mods set value {damage:-2,cooldown:2,reach:0.0f,range:0.0f}

# 5: Frenetico
execute if score #rf_roll vexp.math matches 5 run data modify storage vexp:temp reforge_apply.variant_name set value "Frenetico"
execute if score #rf_roll vexp.math matches 5 run data modify storage vexp:temp reforge_apply.variant_key set value "epic"
execute if score #rf_roll vexp.math matches 5 run data modify storage vexp:temp reforge_apply.mods set value {damage:2,cooldown:-1,reach:0.0f,range:0.0f}
