# dungeons/armor/types/diamond/on_hit.mcfunction
execute store result score #armor_rng vexp.math run random value 1..100
execute if score #armor_rng vexp.math matches 1..5 run effect give @s minecraft:regeneration 2 0 true

