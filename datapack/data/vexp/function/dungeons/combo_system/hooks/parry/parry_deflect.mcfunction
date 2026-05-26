# dungeons/combo_system/hooks/parry_deflect.mcfunction
# @s is the player with an active parry window.
# Deflect nearby hostile projectiles once by reversing their current velocity.

execute as @e[type=#vexp:deflectable_projectiles,distance=..2.5,tag=!vexp.parry_deflected] at @s run function vexp:projectile/deflect_reverse_motion
