# Player weapon gets durability bonus
# @s is the player
# Recovers 1 durability to the current custom weapon in mainhand.

execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp.item run return 0

# Read current damage from the vanilla component
scoreboard players set #weapon_damage vexp.math 0
execute if data entity @s equipment.offhand.components."minecraft:damage" store result score #weapon_damage vexp.math run data get entity @s equipment.offhand.components."minecraft:damage"

# Decremenmt by 1 use
scoreboard players remove #weapon_damage vexp.math 1

# Write damage back to item unconditionally (includes the breaking value)
execute store result storage vexp:temp durability.damage int 1 run scoreboard players get #weapon_damage vexp.math
function vexp:dungeons/combo_system/hooks/write_damage_to_item_offhand with storage vexp:temp durability

# Feedback
function vexp:dungeons/armor/types/diamond/durability_bonus_fx
