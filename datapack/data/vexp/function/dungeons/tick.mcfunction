# dungeons/tick.mcfunction
# Main Tick Loop

# 1. Main Dungeons expansion systems
function vexp:dungeons/reforge/tick
function vexp:dungeons/lore/tick
function vexp:dungeons/combo_system/tick

# 2. Custom Dungeons Items and weapons tick functions
function vexp:dungeons/armor/tick
function vexp:dungeons/weapons/bow/tick
function vexp:dungeons/weapons/bow/arrows/tick
function vexp:dungeons/weapons/dagger/tick
#function vexp:dungeons/weapons/axe/tick
#function vexp:dungeons/weapons/spear/tick
#function vexp:dungeons/weapons/scythe/tick
#function vexp:dungeons/weapons/sword/tick

# 3. Custom Enchantments tick functions
function vexp:dungeons/enchantments/tick

# 4. Custom combat states
function vexp:dungeons/states/tick

# 5. Handle when new items found
#execute as @a run function vexp:dungeons/handle_new_weapons/check_hand
