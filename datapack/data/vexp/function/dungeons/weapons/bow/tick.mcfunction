# Bow on tick hook
# Native bow integration: tag fired arrows per bow type and process custom arrow hooks.

# 1) Detect players that fired a bow this tick.
scoreboard players operation @s vexp.bow_shot_delta = @s vexp.bow_used
scoreboard players operation @s vexp.bow_shot_delta -= @s vexp.bow_used_prev

# Mark new arrows and classify tiers
execute if score @s vexp.bow_shot_delta matches 1.. at @s run function vexp:dungeons/weapons/bow/arrows/mark_new_arrow

# Reset draw time when player is not holding a custom bow.
execute if score @s vexp.bow_shot_delta matches 1.. run scoreboard players set @s vexp.bow_draw_ticks 0

# Keep previous value for shot classification, then reset after the shot has been processed.
execute if score @s vexp.bow_shot_delta matches 1.. run scoreboard players set @s vexp.bow_draw_ticks 0

# Keep previous draw value for next tick release detection.
scoreboard players operation @s vexp.arrow_draw_ticks = @s vexp.bow_draw_ticks
scoreboard players operation @s vexp.bow_used_prev = @s vexp.bow_used
