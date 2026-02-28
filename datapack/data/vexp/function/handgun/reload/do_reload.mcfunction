# Quitar 1 bala
clear @s poisonous_potato[custom_data~{vexp:{type:"handgun_ammo"}}] 1

# Leer ammo actual y subirla 1
execute store result score @s vexp.ammo run data get entity @s SelectedItem.components."minecraft:custom_data".vexp.ammo
scoreboard players add @s vexp.ammo 1
execute if score @s vexp.ammo matches 7.. run scoreboard players set @s vexp.ammo 6

# Leer damage actual (para mantener la durabilidad)
execute store result score @s vexp.damage run data get entity @s SelectedItem.components."minecraft:damage"

# Guardar y aplicar macro
execute store result storage vexp:temp item.new_damage int 1 run scoreboard players get @s vexp.damage
execute store result storage vexp:temp item.ammo int 1 run scoreboard players get @s vexp.ammo
function vexp:handgun/apply_item_macro with storage vexp:temp item

# Feedback de sonido
playsound minecraft:item.spyglass.use player @a[distance=..10] ~ ~ ~ 1 1.2
playsound block.iron_trapdoor.open player @a[distance=..10] ~ ~ ~ 1 1.2