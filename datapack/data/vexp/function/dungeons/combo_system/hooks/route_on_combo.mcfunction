# Route on_combo by quality and item
# @s is the player
# Uses storage vexp:dungeons.weapon combo_params {item, quality}

# Temporary anti-knockback state while attacking with gauntlets
execute if data storage vexp:dungeons.weapon combo_params{item:"gauntlets"} run function vexp:utils/states/gauntlets_guard_apply

# 1. Special qualities route (Netherite, Echo, Diamond, Gold)
$execute if data storage vexp:dungeons.weapon combo_params{quality:"netherite"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/$(item)/netherite/on_combo
$execute if data storage vexp:dungeons.weapon combo_params{quality:"echo"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/$(item)/echo/on_combo
$execute if data storage vexp:dungeons.weapon combo_params{quality:"diamond"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/$(item)/diamond/on_combo
$execute if data storage vexp:dungeons.weapon combo_params{quality:"gold"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/$(item)/gold/on_combo

# 2. Default route (normal/legacy/undefined qualities)
$execute unless data storage vexp:dungeons.weapon combo_params{quality:"netherite"} unless data storage vexp:dungeons.weapon combo_params{quality:"echo"} unless data storage vexp:dungeons.weapon combo_params{quality:"diamond"} unless data storage vexp:dungeons.weapon combo_params{quality:"gold"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/$(item)/on_combo
