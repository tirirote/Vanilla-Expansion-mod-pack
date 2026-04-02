# dungeons/armor/types/leather/on_sprint.mcfunction
# 2% chance to spawn one common loot item while sprinting.
execute store result score #armor_rng vexp.math run random value 1..100
execute if score #armor_rng vexp.math matches 1..2 run function vexp:dungeons/armor/types/leather/drop_common_loot

