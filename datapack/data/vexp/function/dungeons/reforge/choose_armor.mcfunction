# dungeons/reforge/choose_tool.mcfunction
# Variantes para herramientas (Picos, Azadas, Palas)

# 1: Reforzada
execute if score #rf_roll vexp.math matches 1 run data modify storage vexp:temp reforge_apply.variant_name set value "Reforzada"
execute if score #rf_roll vexp.math matches 1 run data modify storage vexp:temp reforge_apply.variant_key set value "efficiency"
execute if score #rf_roll vexp.math matches 1 run data modify storage vexp:temp reforge_apply.mods set value {defense:-1.0f, damage:0.0f, speed:"Lenta", toughness:1.0f, knockback:"Baja"}

# 2: Ligera
execute if score #rf_roll vexp.math matches 2 run data modify storage vexp:temp reforge_apply.variant_name set value "Ligera"
execute if score #rf_roll vexp.math matches 2 run data modify storage vexp:temp reforge_apply.variant_key set value "speed"
execute if score #rf_roll vexp.math matches 2 run data modify storage vexp:temp reforge_apply.mods set value {defense:-2.0f, damage:0.0f, speed:"Muy Alta", toughness:0.0f, knockback:"Ninguna"}

# 3: Templada
execute if score #rf_roll vexp.math matches 3 run data modify storage vexp:temp reforge_apply.variant_name set value "Templada"
execute if score #rf_roll vexp.math matches 3 run data modify storage vexp:temp reforge_apply.variant_key set value "balanced"
execute if score #rf_roll vexp.math matches 3 run data modify storage vexp:temp reforge_apply.mods set value {defense:0.0f, damage:1.0f, speed:"Media", toughness:0.0f, knockback:"Alta"}

# 4: Mellada
execute if score #rf_roll vexp.math matches 4 run data modify storage vexp:temp reforge_apply.variant_name set value "Mellada"
execute if score #rf_roll vexp.math matches 4 run data modify storage vexp:temp reforge_apply.variant_key set value "bad"
execute if score #rf_roll vexp.math matches 4 run data modify storage vexp:temp reforge_apply.mods set value {defense:-2.0f, damage:0.0f, speed:"Lenta", toughness:0.0f, knockback:"Ninguna"}

# 5: Inmaculada
execute if score #rf_roll vexp.math matches 5 run data modify storage vexp:temp reforge_apply.variant_name set value "Inmaculada"
execute if score #rf_roll vexp.math matches 5 run data modify storage vexp:temp reforge_apply.variant_key set value "epic"
execute if score #rf_roll vexp.math matches 5 run data modify storage vexp:temp reforge_apply.mods set value {defense:1.0f, damage:0.0f, speed:"Alta", toughness:1.0f, knockback:"Media"}
