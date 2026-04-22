# Route on_right_click by quality and item
# @s is the player
# Uses storage vexp:dungeons.weapon combo_params {item, quality}

# 1. Special qualities route (Netherite, Echo, Diamond, Gold)
$execute if data storage vexp:dungeons.weapon combo_params{quality:"netherite"} run function vexp:dungeons/$(item)/netherite/on_right_click
$execute if data storage vexp:dungeons.weapon combo_params{quality:"echo"} run function vexp:dungeons/$(item)/echo/on_right_click
$execute if data storage vexp:dungeons.weapon combo_params{quality:"diamond"} run function vexp:dungeons/$(item)/diamond/on_right_click
$execute if data storage vexp:dungeons.weapon combo_params{quality:"gold"} run function vexp:dungeons/$(item)/gold/on_right_click

# 2. Default route (Normal quality or undefined)
# We use unless guards to ensure only one function runs and to handle missing quality tags
$execute unless data storage vexp:dungeons.weapon combo_params{quality:"netherite"} unless data storage vexp:dungeons.weapon combo_params{quality:"echo"} unless data storage vexp:dungeons.weapon combo_params{quality:"diamond"} unless data storage vexp:dungeons.weapon combo_params{quality:"gold"} run function vexp:dungeons/$(item)/on_right_click
