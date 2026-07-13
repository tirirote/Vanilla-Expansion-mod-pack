# Execute I/II: bonus damage against targets below 50% HP.
# @s = attacker
execute as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/enchantments/custom/hit/execute_try

# Feedback
execute as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/fx/enchantments/execute
function vexp:utils/sound {sound: "minecraft:entity.ravager.step", type: "player", pitch:1}
