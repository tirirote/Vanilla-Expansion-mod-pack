# On hold feedback
execute if score @s vexp.skill_hold_time matches ..3 positioned ~ ~1.6 ~ run particle entity_effect{color:950699327} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.skill_hold_time matches 3..5 positioned ~ ~1.6 ~ run particle entity_effect{color:1707582774} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.skill_hold_time matches 7.. positioned ~ ~1.6 ~ run particle entity_effect{color:-1560346676} ^ ^ ^2 0.0 0.0 0 0 0


execute if score @s vexp.skill_hold_time matches 8 positioned ~ ~1.6 ~ run particle flash{color:-2042981} ^ ^ ^2 1 1 1 1 0
execute if score @s vexp.skill_hold_time matches 8 run function vexp:utils/sound {sound: "minecraft:entity.vindicator.celebrate", type: "player"}
execute if score @s vexp.skill_hold_time matches 8 run function vexp:utils/sound {sound: "minecraft:entity.experience_orb.pickup", type: "player"}
