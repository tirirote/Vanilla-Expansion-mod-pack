#On special attack
#Lapis Special Attack Feedback
particle flash{color:-14845953} ^ ^1.5 ^1 1 1 1 1 0

particle dust_color_transition{from_color:1668607,to_color:793046,scale:0.4} ^ ^1.5 ^1.5 0.2 0.1 0.2 0.3 15
particle dust_color_transition{from_color:1668607,to_color:793046,scale:0.6} ^ ^1.5 ^2 0.3 0.1 0.3 0.2 10
particle dust_color_transition{from_color:1668607,to_color:793046,scale:0.8} ^ ^1.5 ^2.5 0.35 0.1 0.35 0.1 7
particle dust_color_transition{from_color:1668607,to_color:793046,scale:1.7} ^ ^1.5 ^3 0.25 0.1 0.25 0.3 5
particle dust_color_transition{from_color:1668607,to_color:793046,scale:0.8} ^ ^1.5 ^3.5 0.2 0.1 0.2 0.3 7

particle instant_effect{color:1668607,power:1.5} ^ ^1.5 ^1.5 0.35 0.1 0.35 1 1
particle instant_effect{color:1731556,power:1.5} ^ ^1.5 ^2 0.35 0.1 0.35 1 1
particle instant_effect{color:678853,power:1.5} ^ ^1.5 ^2.5 0.35 0.1 0.35 1 1
particle instant_effect{color:937205,power:1.5} ^ ^1.5 ^3 0.35 0.1 0.35 1 1
particle instant_effect{color:793046,power:1.5} ^ ^1.5 ^3.5 0.35 0.1 0.35 1 1

function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.evoker.cast_spell", type: "player", pitch:1}
