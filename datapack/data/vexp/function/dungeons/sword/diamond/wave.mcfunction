function vexp:utils/apply_player_attack_damage {damage: 2, owner: "@p[tag=vexp.attacker]"}
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

#Visuals
execute positioned ~ ~ ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.5, 0.7, 0.65], finalColor: [0.6, 0.9, 0.85], scale: 0.8, dX: 0.25, dY: 0.25, dZ: 0.25, speed: 0.05, count: 10}
particle enchanted_hit ~ ~ ~ 0.2 0.2 0.2 0.2 5
particle instant_effect{color:9437155} ~ ~ ~ 0.2 0.2 0.2 .2 1
particle instant_effect{color:49358} ~ ~ ~ 0.2 0.2 0.2 .2 1
particle glow ~ ~ ~ .2 .2 .2 0.1 1
