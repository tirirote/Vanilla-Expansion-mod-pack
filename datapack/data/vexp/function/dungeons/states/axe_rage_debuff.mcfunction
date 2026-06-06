#Remove tag
tag @s remove vexp.axe_rage
execute store result score #axe_hp_threshold vexp.math run data get entity @s Health
execute if score #axe_hp_threshold vexp.math matches 2.. run damage @s 1 magic by @s

#Debuff
effect give @s mining_fatigue 3 1 true
effect give @s slowness 3 1 true
effect give @s glowing 1 0 true
team join vexp.dark_red
function vexp:utils/sound {sound: "minecraft:entity.vindicator.hurt", type: "player"}
