$damage @s $(pursuit_damage) vexp:combo_hit by @p[tag=vexp.attacker,limit=1]

#Feedback
particle raid_omen ~ ~1 ~ 0.35 0.35 0.35 0.25 3
particle crit ~ ~1 ~ 0.35 0.35 0.35 0.5 15
particle flash{color:-46049} ~ ~ ~ 1 1 1 1 0
function vexp:utils/sound {sound: "minecraft:entity.warden.nearby_close", type: "player"}

