# dungeons/combo_system/hitbox/on_attack.mcfunction

# Find the owner and trigger hit detection + set cooldown
# We MUST update storage for the specific player before calling macros to avoid race conditions
execute as @p[tag=vexp.combo_user,distance=..15] at @s if score @s vexp.id = @e[tag=vexp.combo_hitbox,limit=1,sort=nearest] vexp.id run function vexp:dungeons/combo_system/hooks/apply_params_wrapper
