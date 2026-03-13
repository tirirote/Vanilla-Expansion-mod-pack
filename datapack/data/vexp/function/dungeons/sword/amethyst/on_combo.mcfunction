# dungeons/sword/amethyst/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Effects
execute as @e[tag=vexp.hitted] run effect give @s minecraft:levitation 1 10 true
execute as @e[tag=vexp.hitted] run effect give @s minecraft:slowness 2 1 true

# 30% chance for fragments
function vexp:utils/get_random_128
execute if score #random vexp.math matches ..38 as @e[tag=vexp.hitted] run function vexp:dungeons/states/amethyst_fragmentation
