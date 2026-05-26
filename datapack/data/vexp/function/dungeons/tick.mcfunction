# dungeons/tick.mcfunction
# Main Tick Loop

# 1. PERSISTENCE CLEANUP (Start of tick)
execute as @e[tag=vexp.feedback_glowing] unless entity @s[tag=vexp.hit_candidate] unless entity @s[tag=vexp.hitted] unless entity @s[tag=vexp.hitted.combo_end] run effect clear @s minecraft:glowing
execute as @e[tag=vexp.feedback_glowing] unless entity @s[tag=vexp.hit_candidate] unless entity @s[tag=vexp.hitted] unless entity @s[tag=vexp.hitted.combo_end] run team leave @s
execute as @e[tag=vexp.feedback_glowing] unless entity @s[tag=vexp.hit_candidate] unless entity @s[tag=vexp.hitted] unless entity @s[tag=vexp.hitted.combo_end] run tag @s remove vexp.feedback_glowing

# 2. CORE SYSTEMS
function vexp:dungeons/reforge/tick
function vexp:dungeons/lore/tick
function vexp:dungeons/combo_system/tick
function vexp:dungeons/armor/tick
function vexp:dungeons/weapons/bow/tick
function vexp:dungeons/weapons/bow/arrows/tick
function vexp:dungeons/weapons/dagger/tick
function vexp:dungeons/weapons/scythe/tick
function vexp:dungeons/weapons/sword/tick

# 2.1. PROJECTILE SYSTEM (Global)
execute as @e[type=marker,tag=vexp.projectile] at @s run function vexp:projectile/tick
execute as @e[type=minecraft:armor_stand,tag=vexp.projectile] at @s run function vexp:projectile/tick

# 2.2. Custom Combat States (needs transient tags from this tick, e.g. vexp.attacker)
function vexp:dungeons/states/tick

# 3. TAG CLEANUP (End of tick)
# These tags are marked during the tick and cleared here to allow feedback logic to see them
tag @e[tag=vexp.hit_candidate] remove vexp.hit_candidate
tag @a[tag=vexp.attacker] remove vexp.attacker
tag @e[tag=vexp.hitted] remove vexp.hitted
tag @e[tag=vexp.parried] remove vexp.parried
# Note: vexp.hitted.combo_end is removed in mob_health/update.mcfunction for sync reasons
