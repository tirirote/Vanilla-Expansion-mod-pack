# Durability Management
# @s is the player
# Applies 1 durability loss to the current custom weapon in mainhand.

execute unless data entity @s SelectedItem.components."minecraft:custom_data".vexp.item run return 0

# Ensure the item starts with explicit vanilla damage = 0 if the component is missing
execute unless data entity @s SelectedItem.components."minecraft:damage" run item modify entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"minecraft:damage":0}}

# Read current damage from the vanilla component
scoreboard players set #weapon_damage vexp.math 0
execute if data entity @s SelectedItem.components."minecraft:damage" store result score #weapon_damage vexp.math run data get entity @s SelectedItem.components."minecraft:damage"

# Resolve max damage dynamically from the current item in main hand.
scoreboard players set #weapon_max_damage vexp.math 0
execute if data entity @s SelectedItem.components."minecraft:max_damage" store result score #weapon_max_damage vexp.math run data get entity @s SelectedItem.components."minecraft:max_damage"

# Fallback for crafted/given custom weapons when the vanilla component is not readable here.
execute if score #weapon_max_damage vexp.math matches ..1 if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"wood"} run scoreboard players set #weapon_max_damage vexp.math 59
execute if score #weapon_max_damage vexp.math matches ..1 if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"stone"} run scoreboard players set #weapon_max_damage vexp.math 131
execute if score #weapon_max_damage vexp.math matches ..1 if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"bone"} run scoreboard players set #weapon_max_damage vexp.math 96
execute if score #weapon_max_damage vexp.math matches ..1 if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"copper"} run scoreboard players set #weapon_max_damage vexp.math 190
execute if score #weapon_max_damage vexp.math matches ..1 if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"iron"} run scoreboard players set #weapon_max_damage vexp.math 250
execute if score #weapon_max_damage vexp.math matches ..1 if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"gold"} run scoreboard players set #weapon_max_damage vexp.math 32
execute if score #weapon_max_damage vexp.math matches ..1 if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"diamond"} run scoreboard players set #weapon_max_damage vexp.math 1561
execute if score #weapon_max_damage vexp.math matches ..1 if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"glowing"} run scoreboard players set #weapon_max_damage vexp.math 981
execute if score #weapon_max_damage vexp.math matches ..1 if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"netherite"} run scoreboard players set #weapon_max_damage vexp.math 2031
execute if score #weapon_max_damage vexp.math matches ..1 if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"echo"} run scoreboard players set #weapon_max_damage vexp.math 1891

# Abort if max damage is still unknown (no material matched)
execute if score #weapon_max_damage vexp.math matches 0 run return 0

# Increment by 1 use
scoreboard players add #weapon_damage vexp.math 1

# Write damage back to item unconditionally (includes the breaking value)
execute store result storage vexp:temp durability.damage int 1 run scoreboard players get #weapon_damage vexp.math
function vexp:dungeons/combo_system/hooks/write_damage_to_item with storage vexp:temp durability

# Debug (post-apply readback)
execute unless score #weapon_damage vexp.math >= #weapon_max_damage vexp.math store result score #weapon_after_damage vexp.math run data get entity @s SelectedItem.components."minecraft:damage"

# Break the item manually — vanilla doesn't auto-break items written via command
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math at @s run playsound minecraft:entity.item.break player @a[distance=..16] ~ ~ ~ 1.0 1.0

# Item break particles
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"wood"} at @s run particle item{item:wooden_sword} ~ ~1.5 ~ 0.25 0.25 0.25 0.1 5
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"stone"} at @s run particle item{item:stone_sword} ~ ~1.5 ~ 0.25 0.25 0.25 0.1 5
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"bone"} at @s run particle item{item:bone} ~ ~1.5 ~ 0.25 0.25 0.25 0.1 5
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"copper"} at @s run particle item{item:copper_sword} ~ ~1.5 ~ 0.25 0.25 0.25 0.1 5
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"iron"} at @s run particle item{item:iron_sword} ~ ~1.5 ~ 0.25 0.25 0.25 0.1 5
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"gold"} at @s run particle item{item:golden_sword} ~ ~1.5 ~ 0.25 0.25 0.25 0.1 5
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"diamond"} at @s run particle item{item:diamond_sword} ~ ~1.5 ~ 0.25 0.25 0.25 0.1 5
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"glowing"} at @s run particle item{item:prismarine_shard} ~ ~1.5 ~ 0.25 0.25 0.25 0.1 5
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"netherite"} at @s run particle item{item:netherite_sword} ~ ~1.5 ~ 0.25 0.25 0.25 0.1 5
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if data entity @s SelectedItem.components."minecraft:custom_data".vexp{material:"echo"} at @s run particle item{item:echo_shard} ~ ~1.5 ~ 0.25 0.25 0.25 0.1 5

execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math run item replace entity @s weapon.mainhand with air
