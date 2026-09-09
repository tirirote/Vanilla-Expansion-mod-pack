# echo_ghost_hit tick
particle dust_color_transition{from_color:668982,to_color:6815730,scale:1.7} ~ ~1 ~ 0.2 0.5 0.2 1 1
execute if score @s vexp.dstate matches ..1 run function vexp:utils/deal_damage {damage: 2,type:"magic",by:"@p[limit=1]"}
execute if score @s vexp.dstate matches ..1 positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
execute if score @s vexp.dstate matches ..1 positioned ~ ~1 ~ run function vexp:dungeons/fx/aeo_waves/echo
execute if score @s vexp.dstate matches ..1 run particle minecraft:squid_ink ~ ~1 ~ 0.35 0.35 0.35 0.1 3
