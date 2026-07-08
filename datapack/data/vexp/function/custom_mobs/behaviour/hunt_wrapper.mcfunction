# Select hunt target
$execute as @e[type=$(hunt_targets),sort=nearest,distance=..12] unless entity @s[tag=vexp.custom_mob] unless entity @s[tag=vexp.mob_target] run tag @s add vexp.mob_target
$execute as @e[type=$(hunt_targets),sort=nearest,distance=12..] if entity @s[tag=vexp.mob_target] run tag @s remove vexp.mob_target

# Player fallback
$execute unless entity @e[type=$(hunt_targets),tag=!vexp.custom_mob,sort=nearest,distance=..12] as @p[distance=..12] unless entity @s[tag=vexp.mob_target] run tag @s add vexp.mob_target
$execute unless entity @e[type=$(hunt_targets),tag=!vexp.custom_mob,sort=nearest,distance=..12] as @p[distance=12..] if entity @s[tag=vexp.mob_target] run tag @s remove vexp.mob_target
