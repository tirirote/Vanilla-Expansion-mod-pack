# dungeons/armor/types/iron/on_hit.mcfunction
execute store result score #armor_rng vexp.math run random value 1..100
execute if score #armor_rng vexp.math matches 1..25 run function vexp:dungeons/armor/types/iron/buffed

