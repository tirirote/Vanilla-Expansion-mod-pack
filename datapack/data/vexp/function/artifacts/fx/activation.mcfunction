# Activation FX
effect give @s glowing 5 0 true
team leave @s
team join vexp.yellow

tag @s add vexp.attacker

# Swoosh
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:artifact_activation",position:"~ ~0.5 ~",face_player:0,scale:3.4,random_pos:0,lifetime:10,spawn_on_player:1,follow_owner:1,follow_offset_x:0,follow_offset_y:0.5,follow_offset_z:0}

# Feedback
particle instant_effect{color:11140976,power:1} ~ ~0.5 ~ 0.2 0.2 0.2 1 1
particle instant_effect{color:16772690,power:1} ~ ~0.5 ~ 0.2 0.2 0.2 1 3
particle totem_of_undying ~ ~0.5 ~ 0.2 0.2 0.2 0.6 15
execute positioned ~ ~0.5 ~ run function vexp:utils/feedback/trail_particle {col:-3276932, duration:28, dX:2, dY:0.1, dZ:2, count:5, speed:1}
function vexp:utils/sound {sound: "minecraft:item.totem.use", type: "player", pitch:1}
