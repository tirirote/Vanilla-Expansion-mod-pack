
# 1. Special qualities route (Netherite, Echo, Amethyst)
$execute if data storage vexp:dungeons.weapon combo_params{quality:"netherite"} run function vexp:dungeons/$(item)/netherite/on_parry
$execute if data storage vexp:dungeons.weapon combo_params{quality:"echo"} run function vexp:dungeons/$(item)/echo/on_parry
$execute if data storage vexp:dungeons.weapon combo_params{quality:"amethyst"} run function vexp:dungeons/$(item)/amethyst/on_parry

# 2. Default route (Normal quality or undefined)
$execute unless data storage vexp:dungeons.weapon combo_params{quality:"netherite"} unless data storage vexp:dungeons.weapon combo_params{quality:"echo"} unless data storage vexp:dungeons.weapon combo_params{quality:"amethyst"} run function vexp:dungeons/$(item)/on_parry
