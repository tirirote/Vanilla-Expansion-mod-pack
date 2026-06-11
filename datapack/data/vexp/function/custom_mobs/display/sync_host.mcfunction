# @s is the host mob, execution position is anchored to host eyes

scoreboard players operation #cm_host_id vexp.math = @s vexp.id

execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] unless entity @s[tag=vexp.custom_mob_spin_rotation] if score @s vexp.id = #cm_host_id vexp.math run data modify entity @s Rotation set from entity @e[tag=vexp.custom_mob_host,sort=nearest,limit=1,distance=..1] Rotation

execute as @e[type=item_display,tag=vexp.custom_mob_display,distance=..64] if entity @s[tag=vexp.custom_mob_spin_rotation] if score @s vexp.id = #cm_host_id vexp.math run function vexp:custom_mobs/display/spin_rotation with entity @s data.vexp.mob_display
