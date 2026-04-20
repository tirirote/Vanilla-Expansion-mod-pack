# dungeons/bow/hooks/on_using_bow.mcfunction
# @s is the player that is currently using a bow.

# Count draw time only for custom bows.
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{item:"bow"}}] run scoreboard players add @s vexp.bow_draw_ticks 1

#Subtle Charging Particle Animation
execute if score @s vexp.bow_draw_ticks matches ..8 positioned ~ ~1.6 ~ run particle entity_effect{color:950699327} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 8..18 positioned ~ ~1.6 ~ run particle entity_effect{color:1707582774} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 18.. positioned ~ ~1.6 ~ run particle entity_effect{color:-1560346676} ^ ^ ^2 0.0 0.0 0 0 0

#End Loop
execute if score @s vexp.bow_draw_ticks matches 25 positioned ~ ~1.6 ~ run particle flash{color:-2042981} ^ ^ ^2 0.0 0.0 0 0 0
execute if score @s vexp.bow_draw_ticks matches 42.. run scoreboard players set @s vexp.bow_draw_ticks 24

# Allow re-trigger every tick while using item.
advancement revoke @s only vexp:event/bow_attack
