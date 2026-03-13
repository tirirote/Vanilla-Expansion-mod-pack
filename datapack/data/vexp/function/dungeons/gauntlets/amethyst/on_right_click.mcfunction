# dungeons/gauntlets/amethyst/on_right_click.mcfunction
# @s is the player

# Mode switch
execute if entity @e[tag=vexp.amethyst_target,distance=..25] run function vexp:dungeons/gauntlets/amethyst/telekinesis
execute unless entity @e[tag=vexp.amethyst_target,distance=..25] run function vexp:dungeons/gauntlets/amethyst/launch_proj
