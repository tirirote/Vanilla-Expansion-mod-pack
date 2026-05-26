function vexp:utils/apply_player_attack_damage {damage: 2, owner: "@p[tag=vexp.attacker]"}
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

#Visuals
execute positioned ~ ~ ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.75, 0.7, 0.4], finalColor: [0.9, 0.9, 0.75], scale: 0.8, dX: 0.25, dY: 0.25, dZ: 0.25, speed: 0.05, count: 10}
particle crit ~ ~ ~ 0.2 0.2 0.2 0.2 5
particle instant_effect{color:16776562} ~ ~ ~ 0.2 0.2 0.2 0.2 3
particle end_rod ~ ~ ~ .2 .2 .2 0.1 1
