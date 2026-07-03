# damage_lighter.mcfunction
# Se ejecuta AS el jugador.

execute unless items entity @s weapon.mainhand minecraft:flint_and_steel run return fail

# Leer damage actual y maximo
scoreboard players set #lighter_damage vexp.math 0
execute store result score #lighter_damage vexp.math run data get entity @s SelectedItem.components."minecraft:damage"

# Aplicar +1 daño
scoreboard players add #lighter_damage vexp.math 1
execute store result storage vexp:temp lighter.damage int 1 run scoreboard players get #lighter_damage vexp.math
function vexp:dungeons/combo_system/hooks/write_damage_to_item with storage vexp:temp lighter

# Leer daño máximo
scoreboard players set #lighter_max vexp.math 64

# Romper item si supera max_damage
execute if score #lighter_damage vexp.math >= #lighter_max vexp.math at @s run function vexp:custom_block/macro/sound {sound:"minecraft:entity.item.break"}
execute if score #lighter_damage vexp.math >= #lighter_max vexp.math at @s positioned ~ ~1.4 ~ run particle item{item:"flint_and_steel"} ^ ^ ^0.5 0.1 0.1 0.1 0.05 5

execute if score #lighter_damage vexp.math >= #lighter_max vexp.math run item replace entity @s weapon.mainhand with air
