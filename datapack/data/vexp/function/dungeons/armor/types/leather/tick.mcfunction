# dungeons/armor/types/leather/tick.mcfunction
# Pull nearby dropped items toward the player.
execute as @e[type=item,distance=..6,limit=16,sort=nearest] at @s facing entity @p[distance=..8,limit=1,sort=nearest] eyes run tp @s ^ ^ ^0.15

