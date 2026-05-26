# dungeons/handgun/on_right_click.mcfunction
# @s is the player
execute store result score #handgun_inventory_ammo vexp.math run clear @s minecraft:poisonous_potato[custom_data~{vexp:{type:"handgun_ammo"}}] 0
execute if score #handgun_inventory_ammo vexp.math matches 1.. run function vexp:dungeons/weapons/handgun/on_use
execute unless score #handgun_inventory_ammo vexp.math matches 1.. run function vexp:dungeons/weapons/handgun/empty
