# Gauntlets on right click hook
# @s is the player

# Cache owner ID for self-filter in target queries.
scoreboard players operation #combo_owner_id vexp.id = @s vexp.id

# Attempt to catch a mob if none are currently caught
execute positioned ^ ^ ^2.5 as @e[predicate=vexp:is_target,tag=!vexp.state.catched,distance=..3.5,limit=1,sort=nearest] unless score @s vexp.id = #combo_owner_id vexp.id at @s run function vexp:dungeons/states/catched

# Mark mob
execute positioned ^ ^ ^2.5 as @e[predicate=vexp:is_target,distance=..3.5,limit=1,sort=nearest,tag=vexp.state.catched] unless score @s vexp.id = #combo_owner_id vexp.id run function vexp:dungeons/states/echo_marked

# Feedback
function vexp:dungeons/fx/right_click/echo

