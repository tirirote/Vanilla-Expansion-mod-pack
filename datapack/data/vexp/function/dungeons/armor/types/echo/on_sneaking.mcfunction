# dungeons/armor/types/iron/on_sneaking.mcfunction

# Detect other mobs
execute as @e[predicate=vexp:is_target,distance=..24] run effect give @s glowing 1 0 true
execute as @e[predicate=vexp:is_target,distance=..24] run team join vexp.dark_aqua @s
