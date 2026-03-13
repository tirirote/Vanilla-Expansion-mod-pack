# Route on_hit by quality and item
# @s is the player
# Uses storage vexp:main combo_params {item, quality}

# 1. Special qualities route (Netherite, Echo, Amethyst)
$execute if data storage vexp:main combo_params{quality:"netherite"} as @e[tag=vexp.hitted] at @s run function vexp:dungeons/$(item)/netherite/on_hit
$execute if data storage vexp:main combo_params{quality:"echo"} as @e[tag=vexp.hitted] at @s run function vexp:dungeons/$(item)/echo/on_hit
$execute if data storage vexp:main combo_params{quality:"amethyst"} as @e[tag=vexp.hitted] at @s run function vexp:dungeons/$(item)/amethyst/on_hit

# 2. Default route (Normal quality or undefined)
$execute unless data storage vexp:main combo_params{quality:"netherite"} unless data storage vexp:main combo_params{quality:"echo"} unless data storage vexp:main combo_params{quality:"amethyst"} as @e[tag=vexp.hitted] at @s run function vexp:dungeons/$(item)/on_hit