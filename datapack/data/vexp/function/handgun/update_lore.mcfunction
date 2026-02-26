# 5. Calcular balas restantes y actualizar Lore
execute store result score #temp vexp.dummy run data get entity @s SelectedItem.components."minecraft:damage"
scoreboard players set #calc vexp.dummy 20
scoreboard players operation #calc vexp.dummy -= #temp vexp.dummy

# Guardar en Storage para la macro
execute store result storage vexp:data gun_stats.bullets int 1 run scoreboard players get #calc vexp.dummy
function vexp:handgun/update_lore_macro with storage vexp:data gun_stats