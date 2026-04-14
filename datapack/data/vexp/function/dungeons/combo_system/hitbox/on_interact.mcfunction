# dungeons/combo_system/hitbox/on_interact.mcfunction

# Find the owner and trigger secondary logic + set cooldown
# We use a wrapper to handle storage and item info safely
execute as @p[tag=vexp.combo_user,distance=..15] at @s if score @s vexp.id = @e[tag=vexp.combo_hitbox,limit=1,sort=nearest] vexp.id run function vexp:dungeons/combo_system/hooks/apply_interact_params_wrapper

# Temporarily hide this player's hitbox so the next right-clicks can play vanilla animation
execute as @p[tag=vexp.combo_user,distance=..15] at @s if score @s vexp.id = @e[tag=vexp.combo_hitbox,limit=1,sort=nearest] vexp.id run scoreboard players set @s vexp.hitbox_hide_timer 6
kill @s
