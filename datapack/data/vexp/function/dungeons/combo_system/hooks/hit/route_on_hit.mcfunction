# Route on_hit by quality and item
# @s is the player
# Uses storage vexp:dungeons.weapon combo_params {item, quality}

# Normal hit
# 1. Special qualities route (Netherite, Echo, Diamond, Gold, Glowing)
$execute if data storage vexp:dungeons.weapon combo_params{quality:"netherite"} unless entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/netherite/on_hit
$execute if data storage vexp:dungeons.weapon combo_params{quality:"echo"} unless entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/echo/on_hit
$execute if data storage vexp:dungeons.weapon combo_params{quality:"diamond"} unless entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/diamond/on_hit
$execute if data storage vexp:dungeons.weapon combo_params{quality:"gold"} unless entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/gold/on_hit
$execute if data storage vexp:dungeons.weapon combo_params{quality:"glowing"} unless entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/glowing/on_hit
$execute if data storage vexp:dungeons.weapon combo_params{quality:"bone"} unless entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/bone/on_hit

# 2. Default route (normal/legacy/undefined qualities)
$execute unless data storage vexp:dungeons.weapon combo_params{quality:"netherite"} unless data storage vexp:dungeons.weapon combo_params{quality:"echo"} unless data storage vexp:dungeons.weapon combo_params{quality:"diamond"} unless data storage vexp:dungeons.weapon combo_params{quality:"gold"} unless data storage vexp:dungeons.weapon combo_params{quality:"glowing"} unless data storage vexp:dungeons.weapon combo_params{quality:"bone"} unless entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/on_hit

# Special hit
# 1. Special qualities route (Netherite, Echo, Diamond, Gold, Glowing)
$execute if data storage vexp:dungeons.weapon combo_params{quality:"netherite"} if entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/netherite/on_hit_special
$execute if data storage vexp:dungeons.weapon combo_params{quality:"echo"} if entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/echo/on_hit_special
$execute if data storage vexp:dungeons.weapon combo_params{quality:"diamond"} if entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/diamond/on_hit_special
$execute if data storage vexp:dungeons.weapon combo_params{quality:"gold"} if entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/gold/on_hit_special
$execute if data storage vexp:dungeons.weapon combo_params{quality:"glowing"} if entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/glowing/on_hit_special
$execute if data storage vexp:dungeons.weapon combo_params{quality:"bone"} if entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/bone/on_hit_special

# 2. Default route (normal/legacy/undefined qualities)
$execute unless data storage vexp:dungeons.weapon combo_params{quality:"netherite"} unless data storage vexp:dungeons.weapon combo_params{quality:"echo"} unless data storage vexp:dungeons.weapon combo_params{quality:"diamond"} unless data storage vexp:dungeons.weapon combo_params{quality:"gold"} unless data storage vexp:dungeons.weapon combo_params{quality:"glowing"} unless data storage vexp:dungeons.weapon combo_params{quality:"bone"} if entity @s[tag=vexp.hitted.special] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/weapons/$(item)/on_hit_special
