# Bridge principal de encantamientos en el tick.
# @s es el jugador.

# Hand Enchantments
execute if items entity @s weapon.mainhand *[minecraft:enchantments] run function vexp:dungeons/enchantments/custom/hand_tick

# Armor enchantments
execute if items entity @s armor.* #trimmable_armor[minecraft:enchantments] run function vexp:dungeons/enchantments/custom/armor_tick
