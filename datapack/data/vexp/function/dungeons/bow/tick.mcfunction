# dungeons/bow/tick.mcfunction
# Native bow integration: tag fired arrows per bow type and process custom arrow hooks.

# 1) Detect players that fired a bow this tick.
execute as @a run scoreboard players operation @s vexp.bow_shot_delta = @s vexp.bow_used
execute as @a run scoreboard players operation @s vexp.bow_shot_delta -= @s vexp.bow_used_prev

# Mark new arrows and classify tiers
execute as @a[scores={vexp.bow_shot_delta=1..}] if items entity @s weapon.mainhand *[custom_data~{vexp:{item:"bow"}}] at @s run function vexp:dungeons/bow/arrows/mark_new_arrow

# Reset draw time when player is not holding a custom bow.
execute as @a unless items entity @s weapon.mainhand *[custom_data~{vexp:{item:"bow"}}] run scoreboard players set @s vexp.bow_draw_ticks 0

# Keep previous value for shot classification, then reset after the shot has been processed.
execute as @a[scores={vexp.bow_shot_delta=1..}] if items entity @s weapon.mainhand *[custom_data~{vexp:{item:"bow"}}] run scoreboard players set @s vexp.bow_draw_ticks 0
execute as @a run scoreboard players operation @s vexp.bow_used_prev = @s vexp.bow_used
