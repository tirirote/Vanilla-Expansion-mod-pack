# Route on_hit by quality and item
# @s is the player
# Uses storage vexp:dungeons.weapon combo_params {item, quality}

# Temporary anti-knockback state while attacking with gauntlets
execute if data storage vexp:dungeons.weapon combo_params{item:"gauntlets"} run function vexp:utils/states/gauntlets_guard_apply

# 1. Special qualities route (Netherite, Echo, Diamond, Gold, Glowing)
$execute if data storage vexp:dungeons.weapon combo_params{quality:"netherite"} as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/netherite/on_hit
$execute if data storage vexp:dungeons.weapon combo_params{quality:"echo"} as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/echo/on_hit
$execute if data storage vexp:dungeons.weapon combo_params{quality:"diamond"} as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/diamond/on_hit
$execute if data storage vexp:dungeons.weapon combo_params{quality:"gold"} as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/gold/on_hit
$execute if data storage vexp:dungeons.weapon combo_params{quality:"glowing"} as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/glowing/on_hit

# 2. Default route (normal/legacy/undefined qualities)
$execute unless data storage vexp:dungeons.weapon combo_params{quality:"netherite"} unless data storage vexp:dungeons.weapon combo_params{quality:"echo"} unless data storage vexp:dungeons.weapon combo_params{quality:"diamond"} unless data storage vexp:dungeons.weapon combo_params{quality:"gold"} unless data storage vexp:dungeons.weapon combo_params{quality:"glowing"} as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/on_hit
