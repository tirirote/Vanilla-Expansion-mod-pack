# dungeons/armor/types/gold/on_hit.mcfunction
execute store result score #armor_rng vexp.math run random value 1..100
execute if score #armor_rng vexp.math matches 1..5 run summon minecraft:experience_orb ~ ~1 ~ {Value:1}
execute if score #armor_rng vexp.math matches 1..5 run summon minecraft:experience_orb ~ ~1 ~ {Value:1}
execute if score #armor_rng vexp.math matches 1..5 run summon minecraft:experience_orb ~ ~1 ~ {Value:1}

