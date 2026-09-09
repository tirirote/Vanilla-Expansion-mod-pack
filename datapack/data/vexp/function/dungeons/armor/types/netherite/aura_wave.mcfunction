# Nether armor aura wave
# Buff
function vexp:dungeons/states/nether_buffed
# Damage
execute as @e[predicate=vexp:is_target,distance=..4.5] unless entity @s[tag=vexp.nether_marked] unless entity @s[tag=vexp.nether_buffed] unless entity @s[tag=vexp.armor_equip] at @s run function vexp:dungeons/armor/types/netherite/mark_target

# Feedback
particle flash{color:-8637360} ~ ~1 ~ 1 1 1 1 0
particle flame ~ ~.25 ~ 0.5 0.1 0.5 0.02 5
particle instant_effect{color:5452865,power:-1} ~ ~.25 ~ 0.5 0.1 0.5 0.02 15
particle dust_color_transition{from_color:3679786,to_color:8737350,scale:2.1} ~ ~0.25 ~ 1.0 0.2 1.0 1 15
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player", pitch:1}
