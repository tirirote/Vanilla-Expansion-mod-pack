# Modify target follow range
execute if data entity @s angry_at run data remove entity @s angry_at
execute if data entity @s anger_end_time run data remove entity @s anger_end_time
team leave @s
tag @s remove vexp.bone_modifier
