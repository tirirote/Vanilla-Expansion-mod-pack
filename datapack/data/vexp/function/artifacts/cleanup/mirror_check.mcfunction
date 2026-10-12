# Only clean up when the specific owning player (not just any nearby artifact user) is gone.
# @s is the marked mob

scoreboard players operation #mirror_marked_owner vexp.id = @s vexp.mirror_owner_id
scoreboard players set #mirror_owner_nearby vexp.math 0
execute as @a[tag=vexp.artifact_user,distance=..6] if score @s vexp.id = #mirror_marked_owner vexp.id run scoreboard players set #mirror_owner_nearby vexp.math 1
execute unless score #mirror_owner_nearby vexp.math matches 1 run function vexp:artifacts/cleanup/mirror
