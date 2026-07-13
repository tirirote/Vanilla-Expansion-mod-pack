# Wildness I/II: speed buff + bonus finisher damage + cooldown reduction.
# Bonus damage: 15% / 30% of current combo eff_damage.

execute if score #ench_wildness vexp.math matches 1 run effect give @s minecraft:speed 3 1 true
execute if score #ench_wildness vexp.math matches 2.. run effect give @s minecraft:speed 3 2 true

execute if score #ench_wildness vexp.math matches 1 run effect give @s minecraft:strength 3 0 true
execute if score #ench_wildness vexp.math matches 2.. run effect give @s minecraft:strength 3 1 true

execute store result score #wildness_hp_threshold vexp.math run data get entity @s Health
execute if score #wildness_hp_threshold vexp.math matches 2.. run damage @s 1 magic by @s
effect give @s glowing 3 0 true
team join vexp.red

execute if score #ench_wildness vexp.math matches 1 run scoreboard players remove @s vexp.combo_cooldown 2
execute if score #ench_wildness vexp.math matches 2.. run scoreboard players remove @s vexp.combo_cooldown 4
execute if score @s vexp.combo_cooldown matches ..-1 run scoreboard players set @s vexp.combo_cooldown 0

#Feedback
function vexp:dungeons/fx/enchantments/wildness
function vexp:utils/sound {sound: "minecraft:entity.vex.death", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player", pitch:1}
