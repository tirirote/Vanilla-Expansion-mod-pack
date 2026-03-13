# utils/feedback/dust_wave_tick.mcfunction
# Expands dust waves over time. Called every tick.

execute as @s run scoreboard players add @s vexp.anim_frame 1

tp @s ~ ~ ~ ~20 ~

execute as @s[scores={vexp.anim_frame=1}] run data merge entity @s {data:{wave_emit:{dX:0.1,dY:0,dZ:0.1,speed:0.1,count:3}}}
execute as @s[scores={vexp.anim_frame=1}] at @s positioned ^ ^ ^1 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit
execute as @s[scores={vexp.anim_frame=1}] at @s positioned ^ ^ ^-1 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit

execute as @s[scores={vexp.anim_frame=4}] at @s positioned ^ ^ ^1.125 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit
execute as @s[scores={vexp.anim_frame=4}] at @s positioned ^ ^ ^-1.125 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit

execute as @s[scores={vexp.anim_frame=6}] at @s positioned ^ ^ ^1.25 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit
execute as @s[scores={vexp.anim_frame=6}] at @s positioned ^ ^ ^-1.25 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit

execute as @s[scores={vexp.anim_frame=8}] at @s positioned ^ ^ ^1.375 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit
execute as @s[scores={vexp.anim_frame=8}] at @s positioned ^ ^ ^-1.375 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit

execute as @s[scores={vexp.anim_frame=10}] at @s positioned ^ ^ ^1.5 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit
execute as @s[scores={vexp.anim_frame=10}] at @s positioned ^ ^ ^-1.5 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit

execute as @s[scores={vexp.anim_frame=12}] at @s positioned ^ ^ ^1.625 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit
execute as @s[scores={vexp.anim_frame=12}] at @s positioned ^ ^ ^-1.625 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit

execute as @s[scores={vexp.anim_frame=14}] at @s positioned ^ ^ ^1.75 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit
execute as @s[scores={vexp.anim_frame=14}] at @s positioned ^ ^ ^-1.75 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit

execute as @s[scores={vexp.anim_frame=16}] at @s positioned ^ ^ ^1.875 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit
execute as @s[scores={vexp.anim_frame=16}] at @s positioned ^ ^ ^-1.875 run function vexp:utils/feedback/dust_particle with entity @s data.wave_emit

kill @s[scores={vexp.anim_frame=18..}]
