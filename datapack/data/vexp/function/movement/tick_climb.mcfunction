# Movement Tick - Climb module


# Keep player attached while sneaking near a wall
execute as @a if predicate vexp:is_airborne_sneaking at @s anchored eyes unless block ^ ^ ^0.5 #minecraft:replaceable run function vexp:movement/wall_cling

# Re-arm climb only on sneak release edge (prev sneak=1 and now not sneaking)
execute as @a if score @s vexp.move_prev_sneak matches 1 unless predicate vexp:is_sneaking run scoreboard players set @s vexp.move_climb_ready 1

# Climb while clinging if re-armed by sneak release
execute as @a unless predicate vexp:is_sneaking if score @s vexp.move_climb_ready matches 1 at @s anchored eyes unless block ^ ^ ^0.5 #minecraft:replaceable run function vexp:movement/wall_climb
execute as @a unless predicate vexp:is_sneaking if score @s vexp.move_climb_ready matches 1 at @s anchored eyes unless block ^ ^ ^0.5 #minecraft:replaceable run scoreboard players set @s vexp.move_climb_ready 0