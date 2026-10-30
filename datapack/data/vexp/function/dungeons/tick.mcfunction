# dungeons/tick.mcfunction
# Main Tick Loop

# Main Dungeons expansion systems
function vexp:dungeons/reforge/tick
execute as @a run function vexp:dungeons/lore/tick
function vexp:dungeons/combo_system/tick

# Dungeons Items and weapons tick functions
# Armor
function vexp:dungeons/armor/tick
# Bow an arrows
execute as @a if items entity @s weapon.mainhand *[custom_data~{vexp:{item:"bow"}}] run function vexp:dungeons/weapons/bow/tick
function vexp:dungeons/weapons/bow/arrows/tick
# Daggers
function vexp:dungeons/weapons/dagger/tick

# Enchantments tick functions
function vexp:dungeons/enchantments/tick

# Artifacts tick functions
function vexp:artifacts/tick

# Combat states
function vexp:dungeons/states/tick

# Handle when new items found
execute as @a run function vexp:dungeons/handle_new_weapons/check_new

# Cleanup
tag @e[tag=vexp.hit_candidate] remove vexp.hit_candidate
tag @e[tag=vexp.hitted] remove vexp.hitted
