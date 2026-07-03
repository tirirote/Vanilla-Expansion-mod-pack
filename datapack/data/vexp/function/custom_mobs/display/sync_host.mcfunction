# @s is the host mob, execution position is anchored to host eyes

# Adjust rotation to all item displays
execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] unless entity @s[tag=vexp.custom_mob_spin_rotation] if score @s vexp.id = @e[tag=vexp.custom_mob,sort=nearest,distance=..0.1,limit=1] vexp.id run data modify entity @s Rotation set from entity @e[tag=vexp.custom_mob,sort=nearest,limit=1,distance=..1] Rotation
execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] unless entity @s[tag=vexp.custom_mob_spin_rotation] if score @s vexp.id = @e[tag=vexp.custom_mob,sort=nearest,distance=..0.1,limit=1] vexp.id run data modify entity @s Rotation[1] set value 0.0f

execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] if entity @s[tag=vexp.custom_mob_spin_rotation] if score @s vexp.id = @e[tag=vexp.custom_mob,sort=nearest,distance=..0.1,limit=1] vexp.id run function vexp:custom_mobs/display/spin_rotation with entity @s data.vexp.mob_display

# Clean mob inventory item display at the start of the tick
execute as @e[type=item_display,tag=vexp.custom_mob_display,tag=vexp.custom_mob_inventory,distance=..64] if score @s vexp.id = @e[tag=vexp.custom_mob,tag=!vexp.mob_got_item,sort=nearest,distance=..0.1,limit=1] vexp.id run ride @s dismount
execute as @e[type=item_display,tag=vexp.custom_mob_display,tag=vexp.custom_mob_inventory,distance=..64] if score @s vexp.id = @e[tag=vexp.custom_mob,tag=!vexp.mob_got_item,sort=nearest,distance=..0.1,limit=1] vexp.id run tp @s ~ ~-2 ~
