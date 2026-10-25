# @s is the hitted entity after damage has been applied
execute unless score @s vexp.hit_success matches 1.. run return 0

execute store result score #hp_new vexp.math run data get entity @s Health 100
scoreboard players operation #damage_raw vexp.math = @s vexp.old_hp
scoreboard players operation #damage_raw vexp.math -= #hp_new vexp.math

# Display custom damage via macro
$execute if score #damage_raw vexp.math matches ..0 run scoreboard players set #damage_custom vexp.math $(damage)
scoreboard players operation #damage_custom vexp.math *= #100 vexp.math
execute if score #damage_raw vexp.math matches ..0 run scoreboard players operation #damage_raw vexp.math = #damage_custom vexp.math

# Fallback: get damage via final effective damage
execute if score #damage_raw vexp.math matches 0 store result score #damage_raw vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 100

data modify storage vexp:temp Damage.color set value "yellow"
data modify storage vexp:temp Damage.bold set value false
data modify storage vexp:temp Damage.prefix set value " -"
data modify storage vexp:temp Damage.suffix set value " "
data modify storage vexp:temp Damage.critical set value 0b
execute if entity @s[tag=vexp.hitted.combo_end] run data modify storage vexp:temp Damage.color set value "red"
execute if entity @s[tag=vexp.hitted.combo_end] run data modify storage vexp:temp Damage.bold set value false
execute if entity @s[tag=vexp.hitted.critical] run data modify storage vexp:temp Damage.color set value "gold"
execute if entity @s[tag=vexp.hitted.critical] run data modify storage vexp:temp Damage.bold set value true
execute if entity @s[tag=vexp.hitted.critical] run data modify storage vexp:temp Damage.prefix set value "※ -"
execute if entity @s[tag=vexp.hitted.critical] run data modify storage vexp:temp Damage.suffix set value " ※"
execute if entity @s[tag=vexp.hitted.critical] run data modify storage vexp:temp Damage.critical set value 1b

# Custom indicator feedback when hit missed
execute if score #damage_raw vexp.math matches ..-1 run data modify storage vexp:temp Damage.prefix set value ""
execute if score #damage_raw vexp.math matches ..-1 run data modify storage vexp:temp Damage.suffix set value ""
execute if score #damage_raw vexp.math matches ..-1 run data modify storage vexp:temp Damage.color set value "gray"
execute if score #damage_raw vexp.math matches ..-1 run data modify storage vexp:temp Damage.color set value "gray"
execute if score #damage_raw vexp.math matches ..-1 run data modify storage vexp:temp Damage.val set value " MISS "
execute if score #damage_raw vexp.math matches ..-1 run function vexp:utils/sound {sound: "minecraft:entity.player.attack.nodamage", type: "player", pitch:1}

execute if score #damage_raw vexp.math matches 1.. run scoreboard players operation #damage vexp.math = #damage_raw vexp.math
execute if score #damage_raw vexp.math matches 1.. run scoreboard players add #damage vexp.math 99
execute if score #damage_raw vexp.math matches 1.. store result storage vexp:temp Damage.val int 0.01 run scoreboard players get #damage vexp.math

# Spawn Indicator
function vexp:mob_health/spawn_damage

scoreboard players operation @s vexp.old_hp -= #damage_raw vexp.math
execute if score @s vexp.old_hp matches ..0 run scoreboard players set @s vexp.old_hp 0

# Per-hit temporary flag cleanup
tag @s remove vexp.hitted.critical
tag @s remove vexp.hitted.combo_end
tag @s remove vexp.hitted_miss
