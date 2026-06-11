# dungeons/combo_system/hit_candidate.mcfunction
# @s is the mob candidate

# Priority: If already hitted (yellow/red), skip white
execute if entity @s[tag=vexp.hitted] run return 0
execute if entity @s[tag=vexp.hitted.combo_end] run return 0

#Alternative hit feedback to glowing vvv
# Apply glowing with Dark Gray color (via team)
#data modify entity @s[type=item_display,tag=vexp.custom_block.dummy] Glowing set value true
#effect give @s[tag=!vexp.custom_block.dummy_mob] minecraft:glowing 1 1 true
#team join vexp.white @s
#tag @s add vexp.feedback_glowing

# Mark for cleanup
tag @s add vexp.hit_candidate
