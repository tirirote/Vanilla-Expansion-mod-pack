# Make all mobs follow the player
execute if entity @s[predicate=vexp:is_sneaking] run tag @s add vexp.enchantment_taunt

execute if entity @s[tag=vexp.enchantment_taunt] run scoreboard players operation #taunt_owner_id vexp.id = @s vexp.id
execute if entity @s[tag=vexp.enchantment_taunt] as @e[predicate=vexp:is_target,distance=..16] unless score @s vexp.id = #taunt_owner_id vexp.id at @s run function vexp:custom_mobs/helpers/try_pathfinding {speed:0.3, target_tag:vexp.enchantment_taunt}
execute if entity @s[tag=vexp.enchantment_taunt] as @e[predicate=vexp:is_target,distance=..16] unless score @s vexp.id = #taunt_owner_id vexp.id at @s run particle instant_effect{color:[0.9,0.75,1.0],power:1} ~ ~1 ~ 0.2 0.2 0.2 1 1

# Feedback
execute if entity @s[tag=vexp.enchantment_taunt] positioned ~ ~1 ~ run function vexp:utils/feedback/trail_particle {col:[0.9,0.75,1.0], duration:10, dX:0.5, dY:0.5, dZ:0.5, count:3, speed:1}
execute unless entity @s[predicate=vexp:is_sneaking] if entity @s[tag=vexp.enchantment_taunt] run function vexp:utils/sound {sound: "minecraft:block.note_block.chime", type: "player", pitch:1}

# Remove tag
execute unless entity @s[predicate=vexp:is_sneaking] run tag @s remove vexp.enchantment_taunt
