# echo_ghost_hit tick
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 1.7, dX: .2, dY: .5, dZ: .2, speed: 1, count: 1}
execute if score @s vexp.dstate matches ..1 run function vexp:utils/deal_damage {damage: 2,type:"magic",by:"@p[limit=1]"}
execute if score @s vexp.dstate matches ..1 positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
execute if score @s vexp.dstate matches ..1 positioned ~ ~1 ~ run function vexp:dungeons/fx/aeo_waves/echo
execute if score @s vexp.dstate matches ..1 run particle minecraft:squid_ink ~ ~1 ~ 0.35 0.35 0.35 0.1 3
