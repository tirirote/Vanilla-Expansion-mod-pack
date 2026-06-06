# dungeons/combo_system/hooks/end_combo.mcfunction
# @s is the player

# 1. Trigger combo hook for all hitted entities
execute as @e[tag=vexp.hitted,distance=..8] at @s run tag @s add vexp.hitted.combo_end

# Re-apply combo-end visual feedback after combo_end is tagged.
execute as @e[tag=vexp.hitted.combo_end,distance=..8] at @s run team join vexp.red @s
execute as @e[tag=vexp.hitted.combo_end,distance=..8] at @s run tag @s add vexp.feedback_glowing
execute as @e[tag=vexp.hitted.combo_end,distance=..8] at @s run effect give @s[tag=!vexp.custom_block.dummy_mob] minecraft:glowing 1 1 true
execute as @e[tag=vexp.hitted.combo_end,distance=..8] at @s run data modify entity @s[type=item_display,tag=vexp.custom_block.dummy] Glowing set value true

function vexp:dungeons/combo_system/hooks/combo/route_on_combo with storage vexp:dungeons.weapon combo_params
function vexp:dungeons/enchantments/post_end_combo
function vexp:dungeons/armor/on_combo

#Particle Feedback
execute as @e[tag=vexp.hitted,distance=..8] at @s run particle minecraft:damage_indicator ~ ~1 ~ .5 .5 .5 0.2 3

# 2. Reset combo score
scoreboard players set @s vexp.combo 0

# 3. Final cleanup of combo state
tag @s remove vexp.combo_end
