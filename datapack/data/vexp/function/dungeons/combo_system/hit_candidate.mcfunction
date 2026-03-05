# dungeons/combo_system/hit_candidate.mcfunction
# @s is the mob candidate

# Priority: If already hitted (yellow/red), skip white
execute if entity @s[tag=vexp.hitted] run return 0
execute if entity @s[tag=vexp.hitted.combo_end] run return 0

# Join white team and apply glowing
team join vexp.white @s
effect give @s minecraft:glowing 1 1 true

# Mark for cleanup
tag @s add vexp.hit_candidate
