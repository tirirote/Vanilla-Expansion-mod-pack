# dungeons/bow/glowing/on_right_click.mcfunction
# @s is the player

#Subtle Charging Particle Animation
execute if score @s vexp.bow_draw_ticks matches ..8 positioned ~ ~1.6 ~ run particle entity_effect{color:2030851403} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 8..18 positioned ~ ~1.6 ~ run particle entity_effect{color:-1978949253} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 18.. positioned ~ ~1.6 ~ run particle instant_effect{color:7733213} ^ ^ ^2 0 0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 18.. positioned ~ ~1.6 ~ positioned ^ ^ ^2 run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.2, 0.3], finalColor: [0.4, 0.8, 0.65], scale: 0.8, dX: .1, dY: .1, dZ: .1, speed: 1, count: 1}


#End Loop
execute if score @s vexp.bow_draw_ticks matches 25 positioned ~ ~1.6 ~ run particle flash{color:-6488120} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 25 positioned ~ ~1.6 ~ run particle glow ^ ^ ^2 0.1 0.1 0.1 .1 3

execute if score @s vexp.bow_draw_ticks matches 42.. run scoreboard players set @s vexp.bow_draw_ticks 24

# Default right click behavior placeholder
execute if score @s vexp.bow_draw_ticks matches 1 run function vexp:utils/sound {sound: "minecraft:item.crossbow.loading_start", type: "player"}
execute if score @s vexp.bow_draw_ticks matches 25 run function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
