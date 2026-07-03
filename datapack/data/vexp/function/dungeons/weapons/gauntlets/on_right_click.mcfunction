# dungeons/gauntlets/on_right_click.mcfunction
# @s is the player

# Attempt to catch a mob if none are currently caught
execute positioned ^ ^ ^2.5 as @e[predicate=vexp:is_target,tag=!vexp.state.catched,distance=..3.5,limit=1,sort=nearest] at @s run function vexp:dungeons/states/catched

# Feedback
function vexp:dungeons/fx/right_click/common
