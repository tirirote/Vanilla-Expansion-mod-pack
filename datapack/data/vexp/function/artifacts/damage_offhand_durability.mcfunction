# Durability Management
# @s is the player
# Applies 1 durability loss to the current custom weapon in offhand.

execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp.item run return 0

# Ensure the item starts with explicit vanilla damage = 0 if the component is missing
execute unless data entity @s equipment.offhand.components."minecraft:damage" run item modify entity @s weapon.offhand {"function":"minecraft:set_components","components":{"minecraft:damage":0}}

# Read current damage from the vanilla component
scoreboard players set #artifact_damage vexp.math 0
execute if data entity @s equipment.offhand.components."minecraft:damage" store result score #artifact_damage vexp.math run data get entity @s equipment.offhand.components."minecraft:damage"

# Resolve max damage dynamically from the current item in main hand.
scoreboard players set #artifact_max_damage vexp.math 0
execute if data entity @s equipment.offhand.components."minecraft:max_damage" store result score #artifact_max_damage vexp.math run data get entity @s equipment.offhand.components."minecraft:max_damage"

# Fallback for crafted/given custom weapons when the vanilla component is not readable here.
execute if score #artifact_max_damage vexp.math matches ..1 run scoreboard players set #artifact_max_damage vexp.math 5

# Increment by 1 use
scoreboard players add #artifact_damage vexp.math 1

# Write damage back to item unconditionally (includes the breaking value)
execute store result storage vexp:temp durability.damage int 1 run scoreboard players get #artifact_damage vexp.math
function vexp:dungeons/combo_system/hooks/write_damage_to_item_offhand with storage vexp:temp durability

# Debug (post-apply readback)
execute unless score #artifact_damage vexp.math >= #artifact_max_damage vexp.math store result score #weapon_after_damage vexp.math run data get entity @s equipment.offhand.components."minecraft:damage"

# Break the item manually — vanilla doesn't auto-break items written via command
execute if score #artifact_damage vexp.math >= #artifact_max_damage vexp.math at @s run function vexp:utils/sound {sound: "minecraft:block.copper_bulb.break", type: "player", pitch:1}

# Item break particles
execute if score #artifact_damage vexp.math >= #artifact_max_damage vexp.math run particle item{item:totem_of_undying} ^ ^1.5 ^0.5 0.25 0.25 0.25 0.1 5

execute if score #artifact_damage vexp.math >= #artifact_max_damage vexp.math run item replace entity @s weapon.offhand with air
