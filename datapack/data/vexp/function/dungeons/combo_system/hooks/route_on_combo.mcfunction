# Route on_combo by quality and item
# @s is the player
# Uses storage vexp:main combo_params {item, quality}

# Temporary anti-knockback state while attacking with gauntlets
execute if data storage vexp:main combo_params{item:"gauntlets"} run function vexp:utils/states/gauntlets_guard_apply

# 1. Special qualities route (Netherite, Echo, Amethyst)
$execute if data storage vexp:main combo_params{quality:"netherite"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/$(item)/netherite/on_combo
$execute if data storage vexp:main combo_params{quality:"echo"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/$(item)/echo/on_combo
$execute if data storage vexp:main combo_params{quality:"amethyst"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/$(item)/amethyst/on_combo

# 2. Default route (Normal quality or undefined)
$execute unless data storage vexp:main combo_params{quality:"netherite"} unless data storage vexp:main combo_params{quality:"echo"} unless data storage vexp:main combo_params{quality:"amethyst"} as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/$(item)/on_combo
