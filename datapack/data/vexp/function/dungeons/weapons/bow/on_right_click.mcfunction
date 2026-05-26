# dungeons/bow/on_right_click.mcfunction
# @s is the player

#Subtle Charging Particle Animation
execute if score @s vexp.bow_draw_ticks matches ..8 positioned ~ ~1.6 ~ run particle entity_effect{color:950699327} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 8..18 positioned ~ ~1.6 ~ run particle entity_effect{color:1707582774} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 18.. positioned ~ ~1.6 ~ run particle entity_effect{color:-1560346676} ^ ^ ^2 0.0 0.0 0 0 0

#End Loop
execute if score @s vexp.bow_draw_ticks matches 25 positioned ~ ~1.6 ~ run particle flash{color:-2042981} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 42.. run scoreboard players set @s vexp.bow_draw_ticks 24

# Default right click behavior placeholder
execute if score @s vexp.bow_draw_ticks matches 1 run function vexp:utils/sound {sound: "minecraft:item.crossbow.loading_start", type: "player"}
execute if score @s vexp.bow_draw_ticks matches 25 run function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
