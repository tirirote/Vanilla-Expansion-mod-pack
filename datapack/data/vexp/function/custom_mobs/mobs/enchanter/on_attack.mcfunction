# On attack custom feedback
# @s is the custom mob
execute positioned ~ ~1 ~ run particle instant_effect{color:14176699} ^ ^ ^1.5 0.1 0.1 0.1 1 3
execute positioned ~ ~1 ~ run particle instant_effect{color:13188779} ^ ^ ^2 0.1 0.1 0.1 1 2
execute positioned ~ ~1 ~ run particle instant_effect{color:12139951} ^ ^ ^2.5 0.1 0.1 0.1 1 2
execute positioned ~ ~1 ~ run particle instant_effect{color:10959271} ^ ^ ^3 0.1 0.1 0.1 1 1
execute positioned ~ ~1 ~ run particle instant_effect{color:9256599} ^ ^ ^3.5 0.1 0.1 0.1 1 1
execute positioned ~ ~1 ~ run particle instant_effect{color:7483520} ^ ^ ^4 0.1 0.1 0.1 1 1

execute positioned ~ ~1 ~ run particle dust_color_transition{from_color:14176699,to_color:7483520,scale:0.8} ^ ^ ^1.5 0.1 0.1 0.1 1 3
execute positioned ~ ~1 ~ run particle dust_color_transition{from_color:14176699,to_color:7483520,scale:0.8} ^ ^ ^2 0.1 0.1 0.1 1 3
execute positioned ~ ~1 ~ run particle dust_color_transition{from_color:14176699,to_color:7483520,scale:0.8} ^ ^ ^2.5 0.1 0.1 0.1 1 3
execute positioned ~ ~1 ~ run particle dust_color_transition{from_color:14176699,to_color:7483520,scale:0.8} ^ ^ ^3 0.1 0.1 0.1 1 3
execute positioned ~ ~1 ~ run particle dust_color_transition{from_color:14176699,to_color:7483520,scale:0.8} ^ ^ ^3.5 0.1 0.1 0.1 1 3
execute positioned ~ ~1 ~ run particle dust_color_transition{from_color:14176699,to_color:7483520,scale:0.8} ^ ^ ^4 0.1 0.1 0.1 1 3
execute positioned ~ ~1 ~ run particle dust_color_transition{from_color:14176699,to_color:7483520,scale:0.8} ^ ^ ^4.5 0.1 0.1 0.1 1 3
function vexp:utils/sound {sound: "minecraft:entity.illusioner.cast_spell", type: "player", pitch:1}
