# dungeons/combo_system/hit_candidate.mcfunction
# @s is the mob candidate

# Priority: If already hitted (yellow/red), skip white
execute if entity @s[tag=vexp.hitted] run return 0
execute if entity @s[tag=vexp.hitted.combo_end] run return 0

# Apply glowing with Dark Gray color (via team)
effect give @s minecraft:glowing 1 1 true
team join vexp.white @s

# Mark for cleanup
tag @s add vexp.hit_candidate
tag @s add vexp.feedback_glowing
