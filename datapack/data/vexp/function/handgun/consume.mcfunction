#Aplicar consumo de bala
# Leer daño, sumar 1
execute store result score @s vexp.damage run data get entity @s SelectedItem.components."minecraft:damage"
scoreboard players add @s vexp.damage 1

# Calcular restante
scoreboard players set @s vexp.math 6
scoreboard players operation @s vexp.math -= @s vexp.damage

# 6. Aplicar cambios al item
execute store result storage vexp:temp item.new_damage int 1 run scoreboard players get @s vexp.damage
execute store result storage vexp:temp item.ammo int 1 run scoreboard players get @s vexp.math
function vexp:handgun/apply_item_macro with storage vexp:temp item