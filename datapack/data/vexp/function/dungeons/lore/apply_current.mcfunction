# dungeons/lore/apply_current.mcfunction
# @s is the player holding the item in main hand.

# Default descriptor line.
data modify storage vexp:temp lore_apply set value {desc:"Arma de combate",rc_desc:"Habilidad de click derecho"}

# Descriptor by weapon type.
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"sword"} run data modify storage vexp:temp lore_apply.desc set value "Clásica y equilibrada"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"axe"} run data modify storage vexp:temp lore_apply.desc set value "Frenesí de golpes"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"bow"} run data modify storage vexp:temp lore_apply.desc set value "Combo a distancia"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"dagger"} run data modify storage vexp:temp lore_apply.desc set value "Cortes rápidos"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"gauntlets"} run data modify storage vexp:temp lore_apply.desc set value "Golpes rápidos"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"rapier"} run data modify storage vexp:temp lore_apply.desc set value "Estocadas rápidas y precisas"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"scythe"} run data modify storage vexp:temp lore_apply.desc set value "Gran alcance y área"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"handgun"} run data modify storage vexp:temp lore_apply.desc set value "Gran distancia a base de pirotecnia"

# Ability by weapon type.
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"sword"} run data modify storage vexp:temp lore_apply.rc_desc set value "Realiza parry al próximo ataque"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"axe"} run data modify storage vexp:temp lore_apply.rc_desc set value "Inflige más daño durante el frenesí"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"bow"} run data modify storage vexp:temp lore_apply.rc_desc set value "Disparos rápidos y cargados"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"dagger"} run data modify storage vexp:temp lore_apply.rc_desc set value "Arroja la daga infligiendo daño"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"gauntlets"} run data modify storage vexp:temp lore_apply.rc_desc set value "Atrapa al enemigo"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"rapier"} run data modify storage vexp:temp lore_apply.rc_desc set value "Realiza un dash hacia adelante"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"scythe"} run data modify storage vexp:temp lore_apply.rc_desc set value "Lanza un proyectil ligero"
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"handgun"} run data modify storage vexp:temp lore_apply.rc_desc set value "Dispara consumiendo munición del inventario"

# Read combo stats from current item custom_data.
data modify storage vexp:temp lore_apply.combo_dmg set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.damage
data modify storage vexp:temp lore_apply.combo_reach set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.reach
data modify storage vexp:temp lore_apply.combo_range set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.range
data modify storage vexp:temp lore_apply.combo_cooldown set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.cooldown

# Mark as initialized so lore is applied only once.
data modify storage vexp:temp lore_apply.custom_data set from entity @s SelectedItem.components."minecraft:custom_data"
data modify storage vexp:temp lore_apply.custom_data.vexp.lore_applied set value 1b

# Apply lore + updated custom_data in one macro replacement.
function vexp:dungeons/lore/apply_macro with storage vexp:temp lore_apply
