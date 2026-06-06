# On hold feedback
execute if score @s vexp.skill_hold_time matches ..3 positioned ~ ~1.6 ~ run particle entity_effect{color:2032356461} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.skill_hold_time matches 3..5 positioned ~ ~1.6 ~ run particle entity_effect{color:-1978951775} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.skill_hold_time matches 7.. positioned ~ ~1.6 ~ run particle instant_effect{color:7733213} ^ ^ ^2 0.0 0.0 0 0 0


execute if score @s vexp.skill_hold_time matches 8 positioned ~ ~1.6 ~ run particle flash{color:-8454162} ^ ^ ^2 1 1 1 1 0
execute if score @s vexp.skill_hold_time matches 8 run function vexp:utils/sound {sound: "minecraft:entity.vindicator.celebrate", type: "player"}
execute if score @s vexp.skill_hold_time matches 8 run function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player"}
