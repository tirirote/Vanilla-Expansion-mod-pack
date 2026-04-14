# dungeons/bow/hooks/on_using_bow.mcfunction
# @s is the player that is currently using a bow.

# Count draw time only for custom bows.
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{item:"bow"}}] run scoreboard players add @s vexp.bow_draw_ticks 1

# Allow re-trigger every tick while using item.
advancement revoke @s only vexp:event/bow_attack
