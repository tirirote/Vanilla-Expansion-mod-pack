# dungeons/gauntlets/tick.mcfunction
# Trigger parry only after the player has actually taken damage since entering parry stance
execute as @a[tag=vexp.gauntlets.parry,scores={vexp.gauntlets_parry_timer=1..}] run scoreboard players operation #parry_delta vexp.math = @s vexp.damage_taken
execute as @a[tag=vexp.gauntlets.parry,scores={vexp.gauntlets_parry_timer=1..}] run scoreboard players operation #parry_delta vexp.math -= @s vexp.gauntlets_damage_snapshot
execute as @a[tag=vexp.gauntlets.parry,scores={vexp.gauntlets_parry_timer=1..}] at @s if score #parry_delta vexp.math matches 1.. run function vexp:dungeons/gauntlets/parry_success

# Parry timers
execute as @a[scores={vexp.gauntlets_parry_timer=1..}] run scoreboard players remove @s vexp.gauntlets_parry_timer 1
execute as @a[scores={vexp.gauntlets_boost_timer=1..}] run scoreboard players remove @s vexp.gauntlets_boost_timer 1

# Timeout parry if no hit was received
execute as @a[tag=vexp.gauntlets.parry,scores={vexp.gauntlets_parry_timer=..0}] at @s run function vexp:dungeons/gauntlets/parry_cancel

# Post-parry speed boost window
execute as @a[scores={vexp.gauntlets_boost_timer=1..}] run effect give @s minecraft:speed 1 1 true
