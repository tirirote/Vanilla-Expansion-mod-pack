# Healing I/II: self-heal and absorption after combo finisher.
# I: Instant Health I + Absorption I (3s)
# II: Instant Health II + Absorption II (3s)

execute if score #ench_healing vexp.math matches 1 run effect give @s minecraft:absorption 3 0 true
execute if score #ench_healing vexp.math matches 2.. run effect give @s minecraft:absorption 3 1 true

effect give @s glowing 1 0 true
team join vexp.gold

#Healing FX
function vexp:dungeons/fx/enchantments/healing
