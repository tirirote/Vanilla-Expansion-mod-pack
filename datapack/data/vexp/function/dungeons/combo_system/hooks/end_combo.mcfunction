# dungeons/combo_system/hooks/end_combo.mcfunction
# @s is the player

# 1. Trigger combo hook for all hitted entities
execute as @e[tag=vexp.hitted,distance=..8] at @s run tag @s add vexp.hitted.combo_end
function vexp:dungeons/combo_system/hooks/route_on_combo with storage vexp:main combo_params

# 2. Reset combo score
scoreboard players set @s vexp.combo 0

# 3. Final cleanup of combo state
tag @s remove vexp.combo_end