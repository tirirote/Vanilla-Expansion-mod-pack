# dungeons/bow/arrows/mark_new_arrow.mcfunction
# @s is the shooter player
# Tags the nearest freshly fired arrow, assigns type tag, classifies draw tier, and applies tier damage.

# Replace the freshly fired vanilla arrow by a custom bow arrow with controlled motion.
execute as @e[type=minecraft:arrow,tag=!vexp.bow_arrow,distance=..6,sort=nearest,limit=1,nbt={inGround:0b}] at @s run function vexp:dungeons/bow/arrows/replace_with_custom

# Ensure shooter has an ID, then bind owner_id to the fresh custom arrow.
execute unless score @s vexp.id matches 1.. run function vexp:utils/assign_id
scoreboard players operation #bow_owner_id vexp.math = @s vexp.id
execute store result entity @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.owner_assigned,distance=..6,sort=nearest,limit=1] data.vexp.owner_id int 1 run scoreboard players get #bow_owner_id vexp.math
tag @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.owner_assigned,distance=..6,sort=nearest,limit=1] add vexp.arrow.owner_assigned

# Assign arrow type by bow quality (common qualities share the same hooks)
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"normal"}}}] as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.common_arrow
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"netherite"}}}] as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.netherite_arrow
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"echo"}}}] as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.resonance_arrow
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"gold"}}}] as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.gold_arrow
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"diamond"}}}] as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.diamond_arrow
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"glowing"}}}] as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.glowing_arrow

# Tag fully charged arrows based on draw_ticks threshold per quality
# Common: 16+, Netherite: 12+, Resonance: 10+
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"normal"}}}] if score @s vexp.bow_draw_ticks matches 16.. as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.common_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.combo_arrow_charged
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"netherite"}}}] if score @s vexp.bow_draw_ticks matches 12.. as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.netherite_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.combo_arrow_charged
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"echo"}}}] if score @s vexp.bow_draw_ticks matches 10.. as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.resonance_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.combo_arrow_charged
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"gold"}}}] if score @s vexp.bow_draw_ticks matches 14.. as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.gold_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.combo_arrow_charged
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"diamond"}}}] if score @s vexp.bow_draw_ticks matches 11.. as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.diamond_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.combo_arrow_charged
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"glowing"}}}] if score @s vexp.bow_draw_ticks matches 11.. as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.glowing_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.combo_arrow_charged

# Charged arrows inherit damage from the currently used bow combo params.
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.damage store result entity @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.combo_arrow_charged,tag=!vexp.arrow.damage_applied,distance=..6,sort=nearest,limit=1] damage float 1 run data get entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.damage 1

# Apply damage based on charged vs normal
execute as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.damage_applied,distance=..6,sort=nearest,limit=1] run function vexp:dungeons/bow/arrows/apply_tier_damage
execute as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.damage_applied,distance=..6,sort=nearest,limit=1] run tag @s add vexp.arrow.damage_applied

# Mark assignment done to avoid retagging
execute as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.common_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.arrow.type_assigned
execute as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.netherite_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.arrow.type_assigned
execute as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.resonance_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.arrow.type_assigned
execute as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.gold_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.arrow.type_assigned
execute as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.diamond_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.arrow.type_assigned
execute as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=vexp.glowing_arrow,tag=!vexp.arrow.type_assigned,distance=..6,sort=nearest,limit=1] run tag @s add vexp.arrow.type_assigned
