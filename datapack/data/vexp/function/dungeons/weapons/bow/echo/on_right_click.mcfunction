# dungeons/bow/on_right_click.mcfunction
# @s is the player

#Subtle Charging Particle Animation
execute if score @s vexp.bow_draw_ticks matches ..8 positioned ~ ~1.6 ~ run particle entity_effect{color:2032356461} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 8..18 positioned ~ ~1.6 ~ run particle entity_effect{color:-1978951775} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 18.. positioned ~ ~1.6 ~ run particle instant_effect{color:7733213} ^ ^ ^2 0 0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 18.. positioned ~ ~1.6 ~ run particle ominous_spawning ^ ^ ^2 .1 .1 .1 1 1


#End Loop
execute if score @s vexp.bow_draw_ticks matches 25 positioned ~ ~1.6 ~ run particle flash{color:-8454162} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 25 positioned ~ ~1.6 ~ run particle sculk_soul ^ ^ ^2 0.1 0.1 0.1 .1 1

execute if score @s vexp.bow_draw_ticks matches 42.. run scoreboard players set @s vexp.bow_draw_ticks 24

# Default right click behavior placeholder
execute if score @s vexp.bow_draw_ticks matches 1 run function vexp:utils/sound {sound: "minecraft:item.crossbow.loading_start", type: "player"}
execute if score @s vexp.bow_draw_ticks matches 25 run function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player"}
