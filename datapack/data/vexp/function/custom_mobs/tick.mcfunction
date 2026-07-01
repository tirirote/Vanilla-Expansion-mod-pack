#Main Custom Mob behaviour
execute as @e[tag=vexp.custom_mob] at @s run function vexp:custom_mobs/behaviour/tick

#Custom visuals later vvvvv
# Sync custom displays to their host mob (eyes anchor + host rotation)
execute as @e[tag=vexp.custom_mob] at @s run function vexp:custom_mobs/display/sync_host

# Cleanup orphan displays (host missing/dead/unloaded nearby)
execute as @e[type=item_display,tag=vexp.custom_mob_display] at @s unless entity @e[tag=vexp.custom_mob,distance=..1.5] run kill @s
