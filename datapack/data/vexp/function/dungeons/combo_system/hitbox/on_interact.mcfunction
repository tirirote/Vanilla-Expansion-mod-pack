# dungeons/combo_system/hitbox/on_interact.mcfunction

# Find the owner and trigger secondary logic + set cooldown
# We use a wrapper to handle storage and item info safely
scoreboard players operation #hitbox_owner_id vexp.id = @s vexp.id
execute as @a[tag=vexp.combo_user,distance=..15] at @s if score @s vexp.id = #hitbox_owner_id vexp.id run function vexp:dungeons/combo_system/hooks/interact/apply_interact_params_wrapper

# Temporarily hide this player's hitbox so the next right-clicks can play vanilla animation
execute as @a[tag=vexp.combo_user,distance=..15] at @s if score @s vexp.id = #hitbox_owner_id vexp.id run scoreboard players set @s vexp.hitbox_hide_timer 6
kill @s
