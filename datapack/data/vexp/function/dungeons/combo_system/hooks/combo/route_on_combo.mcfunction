# Route on_combo by quality and item
# @s is the player
# Uses storage vexp:dungeons.weapon combo_params {item, quality}

# 1. Special qualities route (Netherite, Echo, Diamond, Gold, Glowing)
$execute if data storage vexp:dungeons.weapon combo_params{quality:"netherite"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/weapons/$(item)/netherite/on_combo
$execute if data storage vexp:dungeons.weapon combo_params{quality:"echo"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/weapons/$(item)/echo/on_combo
$execute if data storage vexp:dungeons.weapon combo_params{quality:"diamond"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/weapons/$(item)/diamond/on_combo
$execute if data storage vexp:dungeons.weapon combo_params{quality:"gold"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/weapons/$(item)/gold/on_combo
$execute if data storage vexp:dungeons.weapon combo_params{quality:"glowing"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/weapons/$(item)/glowing/on_combo

# 2. Default route (normal/legacy/undefined qualities)
$execute unless data storage vexp:dungeons.weapon combo_params{quality:"netherite"} unless data storage vexp:dungeons.weapon combo_params{quality:"echo"} unless data storage vexp:dungeons.weapon combo_params{quality:"diamond"} unless data storage vexp:dungeons.weapon combo_params{quality:"gold"} unless data storage vexp:dungeons.weapon combo_params{quality:"glowing"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/weapons/$(item)/on_combo
