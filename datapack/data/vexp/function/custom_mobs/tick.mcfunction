# Mob Natural Spawning tick
# Natural spawn conversion (vanilla mobs -> custom mob variants)
function vexp:custom_mobs/natural_spawn/tick

# Custom mob tick functions
# Main Custom Mob behaviour
execute as @e[tag=vexp.custom_mob] at @s run function vexp:custom_mobs/behaviour/tick

# Sync custom displays to their host mob (eyes anchor + host rotation)
execute as @e[tag=vexp.custom_mob] at @s run function vexp:custom_mobs/display/sync_host

# Drop mob inventory item when (host missing/dead/unloaded nearby)
execute as @e[type=item_display,tag=vexp.custom_mob_inventory] at @s unless entity @e[tag=vexp.custom_mob,distance=..2.5] run function vexp:custom_mobs/display/clean_inventory_item

# Cleanup orphan displays (host missing/dead/unloaded nearby)
execute as @e[type=item_display,tag=vexp.custom_mob_display] at @s unless entity @e[tag=vexp.custom_mob,distance=..2.5] run kill @s

