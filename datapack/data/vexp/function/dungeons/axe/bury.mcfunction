function vexp:utils/apply_player_attack_damage {damage: 2, owner: "@p[tag=vexp.attacker]"}
function vexp:utils/motion/apply_knockback {strength:-0.1, y:-1}
effect give @s slowness 2 2 true

execute positioned ~ ~1 ~ run function vexp:utils/feedback/block_hit
#Visuals
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.8,0.8,0.8], finalColor: [0.9, 1.0, 1.0], scale: 1.7, dX: 0.1, dY: 0.1, dZ: 0.1, speed: 0.05, count: 3}
particle crit ~ ~1 ~ 0.2 0.2 0.2 0.2 5
