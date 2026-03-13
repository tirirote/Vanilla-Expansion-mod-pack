# dungeons/gauntlets/echo/swap.mcfunction
# Swap position with marked mob

# 1. Mark player current position
summon minecraft:marker ~ ~ ~ {Tags:["vexp.temp_swap"]}

# 2. TP player to mob
execute at @e[tag=vexp.echo_target,sort=nearest,limit=1] run tp @s ~ ~ ~

# 3. TP mob to old player position
execute as @e[tag=vexp.echo_target,sort=nearest,limit=1] at @e[tag=vexp.temp_swap,limit=1] run tp @s ~ ~ ~

# 4. Effects on mob
execute as @e[tag=vexp.echo_target,sort=nearest,limit=1] run function vexp:utils/deal_damage {amount:2.0}
execute as @e[tag=vexp.echo_target,sort=nearest,limit=1] run effect give @s minecraft:slowness 3 1 true
execute as @e[tag=vexp.echo_target,sort=nearest,limit=1] run effect give @s minecraft:blindness 3 0 true

# 5. Cleanup
tag @e[tag=vexp.echo_target] remove vexp.echo_target
kill @e[tag=vexp.temp_swap]

# Sound
playsound minecraft:entity.warden.sonic_boom ambient @a ~ ~ ~ 1 0.5
