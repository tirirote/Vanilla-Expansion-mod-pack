# Restore original custom equipment visuals once HurtTime ends.

execute if data entity @s data.vexp.mob.hurt_swap.head_model run data modify entity @s equipment.head.components."minecraft:custom_model_data".strings[0] set from entity @s data.vexp.mob.hurt_swap.head_model
execute if data entity @s data.vexp.mob.hurt_swap.chest_asset run data modify entity @s equipment.chest.components."minecraft:equippable".asset_id set from entity @s data.vexp.mob.hurt_swap.chest_asset
execute if data entity @s data.vexp.mob.hurt_swap.legs_asset run data modify entity @s equipment.legs.components."minecraft:equippable".asset_id set from entity @s data.vexp.mob.hurt_swap.legs_asset
execute if data entity @s data.vexp.mob.hurt_swap.feet_asset run data modify entity @s equipment.feet.components."minecraft:equippable".asset_id set from entity @s data.vexp.mob.hurt_swap.feet_asset

data remove entity @s data.vexp.mob.hurt_swap
tag @s remove vexp.mob_hurt_visual_swapped
