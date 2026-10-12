# Waiting for attack
execute positioned ^ ^ ^-0.25 facing entity @e[tag=vexp.mob_target,sort=nearest,limit=1] eyes run function vexp:custom_mobs/helpers/try_pathfinding {speed:0.0,target_tag:"vexp.mob_target"}
# Feedback
particle instant_effect{color:1668607,power:1.5} ^ ^1.5 ^0.5 0.2 0.2 0.2 0 1
particle dust_color_transition{from_color:1668607,to_color:793046,scale:0.8} ^ ^1.5 ^0.5 0.2 0.2 0.2 0 1
