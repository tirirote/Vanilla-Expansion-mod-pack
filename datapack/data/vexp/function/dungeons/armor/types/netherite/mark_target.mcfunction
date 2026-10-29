# Mark when nearby mob
function vexp:dungeons/states/nether_marked
function vexp:utils/deal_damage {damage: 2,type:"magic",by:"@p[tag=vexp.nether_buffed,limit=1]"}
function vexp:dungeons/fx/hits/netherite_hit
