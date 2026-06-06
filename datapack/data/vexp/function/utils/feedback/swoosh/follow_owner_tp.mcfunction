# utils/feedback/swoosh/follow_owner_tp.mcfunction
# @s is the swoosh entity tagged as vexp.swoosh.current.
# Input from storage: x, y, z local offset values.

$execute as @a[distance=..48] if score @s vexp.id = @e[tag=vexp.swoosh.current,limit=1,sort=nearest,distance=..16] vexp.id at @s run tp @e[tag=vexp.swoosh.current,limit=1,sort=nearest,distance=..16] ^$(x) ^$(y) ^$(z)
