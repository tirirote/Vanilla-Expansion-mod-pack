$damage @s $(thundering_damage) vexp:combo_hit by @p[tag=vexp.attacker,limit=1]

particle electric_spark ~ ~1 ~ 0.5 0.5 0.5 0.1 25
particle flash{color:-11050241} ~ ~1 ~ 1 1 1 1 0
particle instant_effect{color:3395583} ~ ~1 ~ 1 0.5 1 0 5

function vexp:dungeons/states/thunder_stunned
