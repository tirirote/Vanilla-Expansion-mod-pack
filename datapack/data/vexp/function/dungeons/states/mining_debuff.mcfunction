# Mining Debuff
execute store result score #minnig_hp_threshold vexp.math run data get entity @s Health
execute if score #minnig_hp_threshold vexp.math matches 2.. run damage @s 1 magic by @s

# Debuff
effect give @s mining_fatigue 5 3 true
effect give @s slowness 5 2 true
effect give @s glowing 1 0 true
team join vexp.gray
function vexp:utils/sound {sound: "minecraft:entity.player.hurt", type: "player", pitch:1}
