# dungeons/combo_system/hitbox/on_attack.mcfunction

# Find the owner and trigger hit detection + set cooldown
# We MUST update storage for the specific player before calling macros to avoid race conditions
scoreboard players operation #hitbox_owner_id vexp.id = @s vexp.id
execute as @a[tag=vexp.combo_user,distance=..15] at @s if score @s vexp.id = #hitbox_owner_id vexp.id run function vexp:dungeons/combo_system/hooks/apply_params_wrapper
