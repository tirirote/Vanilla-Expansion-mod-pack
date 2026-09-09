# Thundering area
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:utils/deal_damage {damage:3}
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:dungeons/fx/enchantments/thundering
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:dungeons/enchantments/custom/combo_end/thundering_spawn_projectile
function vexp:utils/sound {sound: "minecraft:entity.zombie_villager.cure", type: "player", pitch:1}
