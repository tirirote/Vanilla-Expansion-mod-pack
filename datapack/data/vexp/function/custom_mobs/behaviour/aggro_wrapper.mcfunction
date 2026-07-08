# Trigger custom aggro hook
$function vexp:custom_mobs/mobs/$(type)/on_aggro

# Move towards target
$execute unless block ~ ~-0.1 ~ #air if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^$(speed) facing entity @e[tag=vexp.mob_target,sort=nearest,limit=1,distance=1..]
