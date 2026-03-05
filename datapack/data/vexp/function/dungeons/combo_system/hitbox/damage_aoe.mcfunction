# dungeons/combo_system/hitbox/damage_aoe.mcfunction
# @s is the player (attacker)

# Assign 'vexp.hitted' to the nearest valid entity in range around the player's HITBOX
# 1. We find the hitbox that has the same ID as the player
# 2. We execute at its position
# 3. We find the nearest mob and tag it
$execute at @e[type=interaction,tag=vexp.combo_hitbox,distance=..15] if score @s vexp.id = @e[limit=1,sort=nearest] vexp.id as @e[type=!text_display,type=!armor_stand,type=!item_display,type=!block_display,type=!interaction,type=!item_frame,type=!glow_item_frame,type=!experience_orb,type=!marker,type=!area_effect_cloud,type=!item,tag=!vexp.attacker,distance=..$(range),limit=1,sort=nearest] at @s run tag @s add vexp.hitted

# Apply damage to the hitted entity
$execute as @e[tag=vexp.hitted] run damage @s $(damage) minecraft:player_attack by @p