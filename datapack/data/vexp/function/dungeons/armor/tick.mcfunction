# dungeons/armor/tick.mcfunction
# Evaluate armor hooks per player
execute as @a run function vexp:dungeons/armor/process_player
