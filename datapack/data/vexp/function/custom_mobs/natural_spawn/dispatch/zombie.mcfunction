# Zombie-based custom mob candidates (evaluated once per entity lifetime).
# @s is a freshly spawned zombie.
tag @s add vexp.natural_mob_checked

# Baby zombies keep their vanilla behaviour.
execute if data entity @s {IsBaby:1b} run return 0

execute unless entity @s[tag=vexp.custom_mob] run function vexp:custom_mobs/natural_spawn/mobs/enchanter
execute unless entity @s[tag=vexp.custom_mob] run function vexp:custom_mobs/natural_spawn/mobs/vanguarder
execute unless entity @s[tag=vexp.custom_mob] run function vexp:custom_mobs/natural_spawn/mobs/wind_burster
execute unless entity @s[tag=vexp.custom_mob] run function vexp:custom_mobs/natural_spawn/mobs/nightcrower
execute unless entity @s[tag=vexp.custom_mob] run function vexp:custom_mobs/natural_spawn/mobs/snitcher
execute unless entity @s[tag=vexp.custom_mob] run function vexp:custom_mobs/natural_spawn/mobs/lapis_zombie
