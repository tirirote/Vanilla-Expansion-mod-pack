# @s is the host mob, execution position is anchored to host eyes

# Adjust rotation to all item displays
execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] unless entity @s[tag=vexp.custom_mob_spin_rotation] if score @s vexp.id = @e[tag=vexp.custom_mob,sort=nearest,distance=..0.1,limit=1] vexp.id run data modify entity @s Rotation set from entity @e[tag=vexp.custom_mob,sort=nearest,limit=1,distance=..1] Rotation
execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] unless entity @s[tag=vexp.custom_mob_spin_rotation] if score @s vexp.id = @e[tag=vexp.custom_mob,sort=nearest,distance=..0.1,limit=1] vexp.id run data modify entity @s Rotation[1] set value 0.0f

execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] if entity @s[tag=vexp.custom_mob_spin_rotation] if score @s vexp.id = @e[tag=vexp.custom_mob,sort=nearest,distance=..0.1,limit=1] vexp.id run function vexp:custom_mobs/display/spin_rotation with entity @s data.vexp.mob_display

# Hurt visual swap for attached custom item displays.
# Cache base model lazily and swap to *_hurted while the host HurtTime is active.
execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] if score @s vexp.id = @e[tag=vexp.custom_mob,nbt=!{HurtTime:0s},sort=nearest,distance=..0.1,limit=1] vexp.id unless entity @s[tag=vexp.mob_display_hurted] if data entity @s item.components."minecraft:custom_model_data".strings[0] unless data entity @s data.vexp.mob_display.base_model run data modify entity @s data.vexp.mob_display.base_model set from entity @s item.components."minecraft:custom_model_data".strings[0]
execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] if score @s vexp.id = @e[tag=vexp.custom_mob,nbt=!{HurtTime:0s},sort=nearest,distance=..0.1,limit=1] vexp.id unless entity @s[tag=vexp.mob_display_hurted] if data entity @s data.vexp.mob_display.base_model run data modify storage vexp:custom_mobs hurt_display.base_model set from entity @s data.vexp.mob_display.base_model
execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] if score @s vexp.id = @e[tag=vexp.custom_mob,nbt=!{HurtTime:0s},sort=nearest,distance=..0.1,limit=1] vexp.id unless entity @s[tag=vexp.mob_display_hurted] if data entity @s data.vexp.mob_display.base_model run function vexp:custom_mobs/display/set_hurted_model_macro with storage vexp:custom_mobs hurt_display
execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] if score @s vexp.id = @e[tag=vexp.custom_mob,nbt=!{HurtTime:0s},sort=nearest,distance=..0.1,limit=1] vexp.id unless entity @s[tag=vexp.mob_display_hurted] if data entity @s data.vexp.mob_display.base_model run tag @s add vexp.mob_display_hurted

execute as @e[type=item_display,tag=vexp.custom_mob_display,tag=vexp.mob_display_hurted,distance=..64] if score @s vexp.id = @e[tag=vexp.custom_mob,nbt={HurtTime:0s},sort=nearest,distance=..0.1,limit=1] vexp.id if data entity @s data.vexp.mob_display.base_model run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set from entity @s data.vexp.mob_display.base_model
execute as @e[type=item_display,tag=vexp.custom_mob_display,tag=vexp.mob_display_hurted,distance=..64] if score @s vexp.id = @e[tag=vexp.custom_mob,nbt={HurtTime:0s},sort=nearest,distance=..0.1,limit=1] vexp.id run tag @s remove vexp.mob_display_hurted

# Clean mob inventory item display at the start of the tick
execute as @e[type=item_display,tag=vexp.custom_mob_display,tag=vexp.custom_mob_inventory,distance=..64] if score @s vexp.id = @e[tag=vexp.custom_mob,tag=!vexp.mob_got_item,sort=nearest,distance=..0.1,limit=1] vexp.id run ride @s dismount
execute as @e[type=item_display,tag=vexp.custom_mob_display,tag=vexp.custom_mob_inventory,distance=..64] if score @s vexp.id = @e[tag=vexp.custom_mob,tag=!vexp.mob_got_item,sort=nearest,distance=..0.1,limit=1] vexp.id run tp @s ~ ~-2 ~
