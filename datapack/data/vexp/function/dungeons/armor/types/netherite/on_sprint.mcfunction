# dungeons/armor/types/netherite/on_sprint.mcfunction
# Fire trail on valid ground blocks.
execute at @s if block ~ ~ ~ minecraft:air unless block ~ ~-1 ~ minecraft:air run setblock ~ ~ ~ minecraft:fire keep

