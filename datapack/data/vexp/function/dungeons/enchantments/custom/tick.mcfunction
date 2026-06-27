# Bridge principal de encantamientos en el tick.
# @s es el jugador.

# Auto Pickup
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:auto_pickup" run function vexp:dungeons/enchantments/custom/tick/auto_pickup

# Smelting
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:smelting" run function vexp:dungeons/enchantments/custom/tick/smelting
