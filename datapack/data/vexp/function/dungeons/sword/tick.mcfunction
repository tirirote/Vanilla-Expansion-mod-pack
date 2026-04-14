# dungeons/sword/tick.mcfunction

# General parry window: trigger if player took damage during active parry timer
execute as @a[scores={vexp.parry_timer=1..}] run scoreboard players operation #parry_delta vexp.math = @s vexp.damage_taken
execute as @a[scores={vexp.parry_timer=1..}] run scoreboard players operation #parry_delta vexp.math -= @s vexp.parry_damage_snapshot
execute as @a[scores={vexp.parry_timer=1..}] at @s if score #parry_delta vexp.math matches 1.. run function vexp:dungeons/sword/parry_success
execute as @a[scores={vexp.parry_timer=1..}] run scoreboard players remove @s vexp.parry_timer 1

# Netherite tornado markers (Ahora gestionados por el sistema global vexp:projectile)

# Spin attack active for 20 ticks.
execute as @a[scores={vexp.sword_spin_timer=1..}] at @s run tp @s ~ ~ ~ ~20 ~
execute as @a[scores={vexp.sword_spin_timer=1..}] at @s run particle minecraft:poof ^ ^ ^1.5 0 0 0 0.05 1
# AoE damage pulse while spinning.
execute as @a[scores={vexp.sword_spin_timer=1..}] at @s as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..3.2,limit=8,sort=nearest] run damage @s 2 minecraft:player_attack

# Timer decay.
execute as @a[scores={vexp.sword_spin_timer=1..}] run scoreboard players remove @s vexp.sword_spin_timer 1
