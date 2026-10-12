# Artifacts cleanup by type

# Vanilla totem
execute as @a unless predicate vexp:is_airborne if score @s vexp.totem_air_time matches 1.. run scoreboard players set @s vexp.totem_air_time 0

# Scarab
execute as @a unless entity @s[tag=vexp.artifact_user] if score @s vexp.scarab_item_count matches 1.. run scoreboard players set @s vexp.scarab_item_count 0

# Mirror
execute as @a unless entity @s[tag=vexp.artifact_user] if score @s vexp.mirror_mob_count matches 1.. run scoreboard players set @s vexp.mirror_mob_count 0
# Checks the exact owning player's id, not just any nearby artifact user.
execute as @e[tag=vexp.mirror_mob_marked] at @s run function vexp:artifacts/cleanup/mirror_check
execute as @e[type=mannequin,tag=vexp.mirror_clone] at @s unless entity @p[distance=..32] run kill @s

# Mask
execute as @a unless entity @s[tag=vexp.artifact_user] if score @s vexp.mask_mob_count matches 1.. run scoreboard players set @s vexp.mask_mob_count 0
# Checks the exact owning player's id, not just any nearby artifact user.
execute as @e[tag=vexp.mask_friend] at @s run function vexp:artifacts/cleanup/mask_check
