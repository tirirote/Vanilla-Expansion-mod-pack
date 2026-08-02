
# 1. Special qualities route (Netherite, Echo, Diamond, Gold)
$execute if data storage vexp:dungeons.weapon combo_params{quality:"netherite"} run function vexp:dungeons/weapons/$(item)/netherite/on_parry
$execute if data storage vexp:dungeons.weapon combo_params{quality:"echo"} run function vexp:dungeons/weapons/$(item)/echo/on_parry
$execute if data storage vexp:dungeons.weapon combo_params{quality:"diamond"} run function vexp:dungeons/weapons/$(item)/diamond/on_parry
$execute if data storage vexp:dungeons.weapon combo_params{quality:"gold"} run function vexp:dungeons/weapons/$(item)/gold/on_parry
$execute if data storage vexp:dungeons.weapon combo_params{quality:"glowing"} run function vexp:dungeons/weapons/$(item)/glowing/on_parry
$execute if data storage vexp:dungeons.weapon combo_params{quality:"bone"} run function vexp:dungeons/weapons/$(item)/bone/on_parry

# 2. Default route (normal/legacy/undefined qualities)
$execute unless data storage vexp:dungeons.weapon combo_params{quality:"netherite"} unless data storage vexp:dungeons.weapon combo_params{quality:"echo"} unless data storage vexp:dungeons.weapon combo_params{quality:"diamond"} unless data storage vexp:dungeons.weapon combo_params{quality:"gold"} unless data storage vexp:dungeons.weapon combo_params{quality:"glowing"} unless data storage vexp:dungeons.weapon combo_params{quality:"bone"} run function vexp:dungeons/weapons/$(item)/on_parry
