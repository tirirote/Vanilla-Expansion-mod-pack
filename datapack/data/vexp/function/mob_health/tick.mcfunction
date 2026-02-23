# 1. Reset health bars status
tag @e[tag=vexp.health_bar] remove vexp.active

# 2. Optimized path: Entities already initialized (Direct tag selection)
execute as @e[tag=vexp.health_init] at @s if entity @p[distance=..12] run function vexp:mob_health/update

# 3. Slow path: Check for NEW entities (Excluding common non-mob types)
# We only run 'if data entity @s Health' on entities that haven't been initialized yet.
execute as @e[tag=!vexp.health_init,type=!player,type=!armor_stand,type=!item_frame,type=!glow_item_frame,type=!item,type=!experience_orb,type=!marker,type=!area_effect_cloud,type=!interaction,type=!text_display,type=!item_display,type=!block_display] at @s if entity @p[distance=..12] if data entity @s Health run function vexp:mob_health/update

# 4. Cleanup orphan bars
kill @e[tag=vexp.health_bar,tag=!vexp.active]

# 5. Damage Indicators Logic
# Move them up and decrease timer
execute as @e[tag=vexp.damage_indicator] at @s positioned ^ ^ ^.1 run tp @s ^ ^ ^ ~ ~-10
scoreboard players remove @e[tag=vexp.damage_indicator] vexp.timer 1
kill @e[tag=vexp.damage_indicator,scores={vexp.timer=..0}]