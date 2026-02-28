# Leer munición y restar 1
execute store result score @s vexp.ammo run data get entity @s SelectedItem.components."minecraft:custom_data".vexp.ammo
scoreboard players remove @s vexp.ammo 1

# Leer daño y sumar 1 (Desgaste del arma)
execute store result score @s vexp.damage run data get entity @s SelectedItem.components."minecraft:damage"
scoreboard players add @s vexp.damage 1

# Aplicar los cambios al item
execute store result storage vexp:temp item.new_damage int 1 run scoreboard players get @s vexp.damage
execute store result storage vexp:temp item.ammo int 1 run scoreboard players get @s vexp.ammo
function vexp:handgun/apply_item_macro with storage vexp:temp item