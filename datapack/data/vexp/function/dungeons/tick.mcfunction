# dungeons/tick.mcfunction
# Main Tick Loop

# 1. PERSISTENCE CLEANUP (Start of tick)
execute as @e[tag=vexp.feedback_glowing] unless entity @s[tag=vexp.hit_candidate] unless entity @s[tag=vexp.hitted] unless entity @s[tag=vexp.hitted.combo_end] run effect clear @s minecraft:glowing
execute as @e[tag=vexp.feedback_glowing] unless entity @s[tag=vexp.hit_candidate] unless entity @s[tag=vexp.hitted] unless entity @s[tag=vexp.hitted.combo_end] run team leave @s
execute as @e[tag=vexp.feedback_glowing] unless entity @s[tag=vexp.hit_candidate] unless entity @s[tag=vexp.hitted] unless entity @s[tag=vexp.hitted.combo_end] run tag @s remove vexp.feedback_glowing

# 2. CORE SYSTEMS
function vexp:dungeons/combo_system/tick
function vexp:dungeons/dagger/tick
function vexp:dungeons/gauntlets/tick

# 3. TAG CLEANUP (End of tick)
# These tags are marked during the tick and cleared here to allow feedback logic to see them
tag @e[tag=vexp.hit_candidate] remove vexp.hit_candidate
tag @a[tag=vexp.attacker] remove vexp.attacker
tag @e[tag=vexp.hitted] remove vexp.hitted
# Note: vexp.hitted.combo_end is removed in mob_health/update.mcfunction for sync reasons