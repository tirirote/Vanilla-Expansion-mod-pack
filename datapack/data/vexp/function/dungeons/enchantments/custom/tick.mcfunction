# Bridge principal de encantamientos en el tick.
# @s es el jugador.

# Reset scores
execute if score @s vexp.enchant.auto_pickup matches 1.. run scoreboard players reset @s vexp.enchant.auto_pickup
execute if score @s vexp.enchant.smelting matches 1.. run scoreboard players reset @s vexp.enchant.smelting
execute if score @s vexp.enchant.magnetism matches 1.. run scoreboard players reset @s vexp.enchant.magnetism
execute if score @s vexp.enchant.resonance matches 1.. run scoreboard players reset @s vexp.enchant.resonance
execute if score @s vexp.enchant.taunt matches 1.. run scoreboard players reset @s vexp.enchant.taunt
execute if score @s vexp.enchant.levitation matches 1.. run scoreboard players reset @s vexp.enchant.levitation
execute if score @s vexp.enchant.light_step matches 1.. run scoreboard players reset @s vexp.enchant.light_step

# Hand Enchantments
execute if items entity @s weapon.mainhand *[minecraft:enchantments] run function vexp:dungeons/enchantments/custom/hand_tick

# Armor enchantments
execute if items entity @s armor.* #trimmable_armor[minecraft:enchantments] run function vexp:dungeons/enchantments/custom/armor_tick
