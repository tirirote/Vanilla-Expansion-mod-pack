# @s is the host mob, execution position is anchored to host eyes

scoreboard players operation @s vexp.host_id = @s vexp.id

# Adjust rotation to all item displays
execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] unless entity @s[tag=vexp.custom_mob_spin_rotation] if score @s vexp.id = @e[tag=vexp.custom_mob_host,sort=nearest,distance=..1,limit=1] vexp.host_id run data modify entity @s Rotation set from entity @e[tag=vexp.custom_mob_host,sort=nearest,limit=1,distance=..1] Rotation
execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] unless entity @s[tag=vexp.custom_mob_spin_rotation] if score @s vexp.id = @e[tag=vexp.custom_mob_host,sort=nearest,distance=..1,limit=1] vexp.host_id run data modify entity @s Rotation[1] set value 0.0f

execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] if entity @s[tag=vexp.custom_mob_spin_rotation] if score @s vexp.id = @s vexp.host_id run function vexp:custom_mobs/display/spin_rotation with entity @s data.vexp.mob_display

# Clean mob inventory item display
execute unless data entity @s equipment as @e[type=item_display,tag=vexp.custom_mob_display,tag=vexp.custom_mob_inventory,distance=..64] if score @s vexp.id = @e[tag=vexp.custom_mob_host,sort=nearest,distance=..1,limit=1] vexp.host_id run ride @s dismount
