# dungeons/sword/tick.mcfunction

# Spin attack active for 20 ticks.
execute as @a[scores={vexp.sword_spin_timer=1..}] at @s run tp @s ~ ~ ~ ~5 ~

# AoE damage pulse while spinning.
execute as @a[scores={vexp.sword_spin_timer=1..}] at @s as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..3.2,limit=8,sort=nearest] run damage @s 2 minecraft:player_attack

# Timer decay.
execute as @a[scores={vexp.sword_spin_timer=1..}] run scoreboard players remove @s vexp.sword_spin_timer 1
