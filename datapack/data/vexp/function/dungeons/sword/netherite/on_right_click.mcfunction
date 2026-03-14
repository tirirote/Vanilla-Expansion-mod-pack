# dungeons/sword/netherite/on_right_click.mcfunction
# @s is the player

# Spawn two tornado markers orbiting the player
function vexp:dungeons/sword/netherite/tornado_spawn

# Optional startup wave
execute positioned ~ ~-1.5 ~ run function vexp:dungeons/sword/netherite/wave
# Player buff
effect give @s minecraft:resistance 2 1 true
