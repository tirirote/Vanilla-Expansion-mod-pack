# On hold feedback
execute if score @s vexp.skill_hold_time matches ..3 positioned ~ ~1.6 ~ run particle entity_effect{color:-2127926122} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.skill_hold_time matches 3..5 positioned ~ ~1.6 ~ run particle entity_effect{color:-2127926122} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.skill_hold_time matches 7.. positioned ~ ~1.6 ~ run particle instant_effect{color:9437155} ^ ^ ^2 0.0 0.0 0 0 0


execute if score @s vexp.skill_hold_time matches 8 positioned ~ ~1.6 ~ run particle flash{color:-7340061} ^ ^ ^2 1 1 1 1 0
execute if score @s vexp.skill_hold_time matches 8 run function vexp:utils/sound {sound: "minecraft:entity.vindicator.celebrate", type: "player"}
execute if score @s vexp.bow_draw_ticks matches 25 run function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
