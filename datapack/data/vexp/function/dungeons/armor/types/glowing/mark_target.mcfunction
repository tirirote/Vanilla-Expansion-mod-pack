# Mark when nearby mob
function vexp:dungeons/states/glow_marked
function vexp:utils/deal_damage {damage: 1,type:"magic",by:"@p[tag=vexp.glow_buffed,limit=1]"}
function vexp:utils/motion/apply_knockback {strength:-2.0, y:0.2}
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/aeo_waves/glowing
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/glowing_hit
