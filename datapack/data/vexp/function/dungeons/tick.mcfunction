# dungeons/tick.mcfunction
# Main Tick Loop

# 1. PERSISTENCE CLEANUP (Start of tick)
# Reset teams ONLY if the entity no longer has the interaction tags
execute as @e[team=vexp.white] unless entity @s[tag=vexp.hit_candidate] run team leave @s
execute as @e[team=vexp.yellow] unless entity @s[tag=vexp.hitted] run team leave @s
execute as @e[team=vexp.red] unless entity @s[tag=vexp.hitted.combo_end] run team leave @s

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