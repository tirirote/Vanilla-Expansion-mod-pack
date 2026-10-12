# Only clean up when the specific owning player (not just any nearby artifact user) is gone.
# @s is the friendly mob

scoreboard players operation #mask_marked_owner vexp.id = @s vexp.mask_owner_id
scoreboard players set #mask_owner_nearby vexp.math 0
execute as @a[tag=vexp.artifact_user,distance=..16] if score @s vexp.id = #mask_marked_owner vexp.id run scoreboard players set #mask_owner_nearby vexp.math 1
execute unless score #mask_owner_nearby vexp.math matches 1 run function vexp:artifacts/cleanup/mask
