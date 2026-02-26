# Quitar 1 bala
clear @s poisonous_potato[custom_data~{vexp:{type:"handgun_ammo"}}] 1

# Leer damage actual y reducirlo 1
execute store result score @s vexp.damage run data get entity @s SelectedItem.components."minecraft:damage"
scoreboard players remove @s vexp.damage 1
execute if score @s vexp.damage matches ..-1 run scoreboard players set @s vexp.damage 0

# Calcular munición disponible (6 - damage)
scoreboard players set @s vexp.math 6
scoreboard players operation @s vexp.math -= @s vexp.damage

# Guardar y aplicar macro
execute store result storage vexp:temp item.new_damage int 1 run scoreboard players get @s vexp.damage
execute store result storage vexp:temp item.ammo int 1 run scoreboard players get @s vexp.math
function vexp:handgun/apply_item_macro with storage vexp:temp item

# Feedback de sonido
playsound minecraft:item.spyglass.use player @a[distance=..10] ~ ~ ~ 1 1.2
playsound block.iron_trapdoor.open player @a[distance=..10] ~ ~ ~ 1 1.2