# dungeons/gauntlets/echo/on_right_click.mcfunction
# @s is the player

# Mode switch: if already has marked target, swap
execute if entity @e[tag=vexp.echo_target,distance=..25] run function vexp:dungeons/gauntlets/echo/swap
execute unless entity @e[tag=vexp.echo_target,distance=..25] run function vexp:dungeons/gauntlets/echo/launch_proj
