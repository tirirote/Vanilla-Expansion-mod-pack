# Natural spawn conversion entry point.
# Scans freshly spawned vanilla mobs once (tagged right after evaluation) and
# rolls them into a custom mob variant based on biome/structure/chance.
# Each candidate entity type is only ever evaluated a single time in its life.

# Pig Based
execute as @e[type=pig,tag=!vexp.custom_mob,tag=!vexp.natural_mob_checked] at @s run function vexp:custom_mobs/natural_spawn/dispatch/pig

# Chicken Based
execute as @e[type=chicken,tag=!vexp.custom_mob,tag=!vexp.natural_mob_checked] at @s run function vexp:custom_mobs/natural_spawn/dispatch/chicken

# Zombie Based
execute as @e[type=zombie,tag=!vexp.custom_mob,tag=!vexp.natural_mob_checked] at @s run function vexp:custom_mobs/natural_spawn/dispatch/zombie

# Husk Based
execute as @e[type=husk,tag=!vexp.custom_mob,tag=!vexp.natural_mob_checked] at @s run function vexp:custom_mobs/natural_spawn/dispatch/husk

# Skeleton Based
execute as @e[type=skeleton,tag=!vexp.custom_mob,tag=!vexp.natural_mob_checked] at @s run function vexp:custom_mobs/natural_spawn/dispatch/skeleton

# Wolf Based
execute as @e[type=wolf,tag=!vexp.custom_mob,tag=!vexp.natural_mob_checked] at @s run function vexp:custom_mobs/natural_spawn/dispatch/wolf

# Spider Based
execute as @e[type=spider,tag=!vexp.custom_mob,tag=!vexp.natural_mob_checked] at @s run function vexp:custom_mobs/natural_spawn/dispatch/spider

# Vindicator Based
execute as @e[type=vindicator,tag=!vexp.custom_mob,tag=!vexp.natural_mob_checked] at @s run function vexp:custom_mobs/natural_spawn/dispatch/vindicator
