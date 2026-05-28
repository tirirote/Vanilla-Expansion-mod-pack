$damage @s $(committed_damage) vexp:combo_hit by @p[tag=vexp.attacker,limit=1]

# Feedback
particle falling_lava ~ ~ ~ 0.35 0.35 0.35 1 3
particle flash{color:-2602979} ~ ~ ~ 1 1 1 1 0
particle angry_villager ~ ~ ~ 0.25 0.25 0.25 1 1
function vexp:utils/sound {sound: "minecraft:entity.player.hurt", type: "player"}
