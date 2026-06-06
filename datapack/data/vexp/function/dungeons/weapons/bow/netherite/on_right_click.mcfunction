# dungeons/bow/on_right_click.mcfunction
# @s is the player

#Subtle Charging Particle Animation
execute if score @s vexp.bow_draw_ticks matches ..8 positioned ~ ~1.6 ~ run particle entity_effect{color:2034972465} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 8..18 positioned ~ ~1.6 ~ run particle entity_effect{color:-1973009586} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 18.. positioned ~ ~1.6 ~ run particle flame ^ ^ ^2 0 0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 18.. positioned ~ ~1.6 ~ positioned ^ ^ ^2 run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 0.8, dX: 0.1, dY: 0.1, dZ: 0.1, speed: 0.05, count: 1}



#End Loop
execute if score @s vexp.bow_draw_ticks matches 25 positioned ~ ~1.6 ~ run particle flash{color:-8637360} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 25 positioned ~ ~1.6 ~ run particle lava ^ ^ ^2 0.1 0.1 0.1 .1 1

execute if score @s vexp.bow_draw_ticks matches 42.. run scoreboard players set @s vexp.bow_draw_ticks 24

# Default right click behavior placeholder
execute if score @s vexp.bow_draw_ticks matches 1 run function vexp:utils/sound {sound: "minecraft:item.crossbow.loading_start", type: "player"}
execute if score @s vexp.bow_draw_ticks matches 25 run function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
