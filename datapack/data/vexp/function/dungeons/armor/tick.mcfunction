# dungeons/armor/tick.mcfunction
# Evaluate armor hooks per player
execute as @a at @s run function vexp:dungeons/armor/process_player
