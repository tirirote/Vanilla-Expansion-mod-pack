# dungeons/combo_system/hitbox/update_pos.mcfunction
# @s is the interaction entity (hitbox)
# Reach and height logic

# Move the hitbox using the reach parameter from the item
# We use anchored eyes to ensure the 'reach' distance starts from the player's eyes
# We anchor Y locally at -0.4 so the 1.0 height hitbox is perfectly centered along the raycast.
$execute anchored eyes run tp @s ^ ^ ^$(reach)

# FeedBack: Hit Candidate (White Glowing)
# Proxemic feedback for targets inside the hitbox zone
# Using the SAME filters and $(range) as damage_aoe.mcfunction to avoid discrepancies
$execute unless entity @s[tag=vexp.hitbox.cooldown] at @s as @e[type=!#minecraft:arrows,type=!text_display,type=!armor_stand,type=!item_display,type=!block_display,type=!interaction,type=!item_frame,type=!glow_item_frame,type=!experience_orb,type=!marker,type=!area_effect_cloud,type=!item,type=!player,distance=..$(range)] at @s run function vexp:dungeons/combo_system/hit_candidate