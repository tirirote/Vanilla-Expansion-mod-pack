# On special attack feedback hook
# @s is the custom mob

# Summon baby mummies (only with armor)
execute positioned ~ ~ ~1 if block ~ ~ ~ #replaceable run function vexp:custom_mobs/mobs/mummy/summon_minion
execute positioned ~1 ~ ~ if block ~ ~ ~ #replaceable run function vexp:custom_mobs/mobs/mummy/summon_minion

# Feedback
particle instant_effect{color:11771248,power:1.5} ~ ~0.2 ~ 1 0 1 1 5
particle dust_color_transition{from_color:14538414,to_color:10585444,scale:1.7} ~ ~0.2 ~ 1 0 1 1 5
particle block{block_state:"sand"} ~ ~ ~ 1 0 1 0.35 25
function vexp:utils/sound {sound: "minecraft:entity.evoker.prepare_attack", type: "player", pitch:1}
