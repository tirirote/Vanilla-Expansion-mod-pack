# Trigger custom hurt hook
$execute if block ^ ^ ^1 #replaceable run function vexp:custom_mobs/mobs/$(type)/on_hurt_tick

# Global hurt visual swap for invisible humanoids with custom equipment.
# We snapshot base strings via storage and swap once at hurt start.
execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] run data remove storage vexp:custom_mobs hurt_swap

execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.head stone if data entity @s equipment.head.components."minecraft:custom_model_data".strings[0] run data modify storage vexp:custom_mobs hurt_swap.head_model set from entity @s equipment.head.components."minecraft:custom_model_data".strings[0]
execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.head stone if data entity @s equipment.head.components."minecraft:custom_model_data".strings[0] run data modify entity @s data.vexp.mob.hurt_swap.head_model set from storage vexp:custom_mobs hurt_swap.head_model
execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.head stone if data entity @s equipment.head.components."minecraft:custom_model_data".strings[0] run function vexp:custom_mobs/behaviour/hurt_set_head_hurted_macro with storage vexp:custom_mobs hurt_swap

execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.chest stone if data entity @s equipment.chest.components."minecraft:equippable".asset_id run data modify storage vexp:custom_mobs hurt_swap.chest_asset set from entity @s equipment.chest.components."minecraft:equippable".asset_id
execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.chest stone if data entity @s equipment.chest.components."minecraft:equippable".asset_id run data modify entity @s data.vexp.mob.hurt_swap.chest_asset set from storage vexp:custom_mobs hurt_swap.chest_asset
execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.chest stone if data entity @s equipment.chest.components."minecraft:equippable".asset_id run function vexp:custom_mobs/behaviour/hurt_set_chest_hurted_macro with storage vexp:custom_mobs hurt_swap

execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.legs stone if data entity @s equipment.legs.components."minecraft:equippable".asset_id run data modify storage vexp:custom_mobs hurt_swap.legs_asset set from entity @s equipment.legs.components."minecraft:equippable".asset_id
execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.legs stone if data entity @s equipment.legs.components."minecraft:equippable".asset_id run data modify entity @s data.vexp.mob.hurt_swap.legs_asset set from storage vexp:custom_mobs hurt_swap.legs_asset
execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.legs stone if data entity @s equipment.legs.components."minecraft:equippable".asset_id run function vexp:custom_mobs/behaviour/hurt_set_legs_hurted_macro with storage vexp:custom_mobs hurt_swap

execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.feet stone if data entity @s equipment.feet.components."minecraft:equippable".asset_id run data modify storage vexp:custom_mobs hurt_swap.feet_asset set from entity @s equipment.feet.components."minecraft:equippable".asset_id
execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.feet stone if data entity @s equipment.feet.components."minecraft:equippable".asset_id run data modify entity @s data.vexp.mob.hurt_swap.feet_asset set from storage vexp:custom_mobs hurt_swap.feet_asset
execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if items entity @s armor.feet stone if data entity @s equipment.feet.components."minecraft:equippable".asset_id run function vexp:custom_mobs/behaviour/hurt_set_feet_hurted_macro with storage vexp:custom_mobs hurt_swap

execute if entity @s[nbt={HurtTime:10s}] unless entity @s[tag=vexp.mob_hurt_visual_swapped] if data entity @s data.vexp.mob.hurt_swap run tag @s add vexp.mob_hurt_visual_swapped

$execute if entity @s[nbt={HurtTime:10s}] run function vexp:custom_mobs/mobs/$(type)/on_hurt

# Drop item when mob has custom pickup behaviour
execute if entity @s[tag=vexp.mob_got_item] if entity @s[nbt={HurtTime:10s}] run function vexp:custom_mobs/behaviour/drop_item
