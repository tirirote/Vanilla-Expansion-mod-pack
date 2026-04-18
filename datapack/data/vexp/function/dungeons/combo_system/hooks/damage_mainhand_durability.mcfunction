# dungeons/combo_system/hooks/damage_mainhand_durability.mcfunction
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

# Debug (enable with tag vexp.debug_durability)
execute if entity @s[tag=vexp.debug_durability] run tellraw @s [{"text":"[DUR PRE] ","color":"yellow"},{"text":"damage=","color":"gray"},{"score":{"name":"#weapon_damage","objective":"vexp.math"},"color":"white"},{"text":" max=","color":"gray"},{"score":{"name":"#weapon_max_damage","objective":"vexp.math"},"color":"white"}]

# Abort if max damage is invalid/missing
execute if score #weapon_max_damage vexp.math matches ..1 run return 0

# Increment by 1 use
scoreboard players add #weapon_damage vexp.math 1

# Debug (value after increment)
execute if entity @s[tag=vexp.debug_durability] run tellraw @s [{"text":"[DUR HIT] ","color":"gold"},{"text":"next_damage=","color":"gray"},{"score":{"name":"#weapon_damage","objective":"vexp.math"},"color":"white"}]

# Break if reached max damage
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math at @s run playsound minecraft:entity.item.break player @a[distance=..16] ~ ~ ~ 0.8 1.0
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math run item replace entity @s weapon.mainhand with air

# Write exact vanilla damage component back to the item
execute unless score #weapon_damage vexp.math >= #weapon_max_damage vexp.math store result storage vexp:temp durability.damage int 1 run scoreboard players get #weapon_damage vexp.math
execute unless score #weapon_damage vexp.math >= #weapon_max_damage vexp.math run function vexp:dungeons/combo_system/hooks/write_damage_to_item with storage vexp:temp durability

# Debug (post-apply readback)
execute unless score #weapon_damage vexp.math >= #weapon_max_damage vexp.math store result score #weapon_after_damage vexp.math run data get entity @s SelectedItem.components."minecraft:damage"
execute unless score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if entity @s[tag=vexp.debug_durability] run tellraw @s [{"text":"[DUR APPLY] ","color":"aqua"},{"text":"after_damage=","color":"gray"},{"score":{"name":"#weapon_after_damage","objective":"vexp.math"},"color":"white"}]

# Debug (explicit break branch)
execute if score #weapon_damage vexp.math >= #weapon_max_damage vexp.math if entity @s[tag=vexp.debug_durability] run tellraw @s [{"text":"[DUR BREAK] ","color":"red"},{"text":"item broke","color":"white"}]
