# dungeons/combo_system/hitbox/check_cooldown.mcfunction
# @s is the hitbox (interaction)

# Find the player with matching ID and check if they have 0 cooldown
# If so, tag the hitbox as ready
execute as @a[tag=vexp.combo_user] if score @s vexp.id = @e[tag=vexp.combo_hitbox,sort=nearest,limit=1] vexp.id if score @s vexp.combo_cooldown matches 0 run tag @e[tag=vexp.combo_hitbox,sort=nearest,limit=1] add vexp.hitbox.ready
