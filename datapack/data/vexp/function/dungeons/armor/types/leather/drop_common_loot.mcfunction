# dungeons/armor/types/leather/drop_common_loot.mcfunction
execute store result score #armor_loot_roll vexp.math run random value 1..8
function vexp:dungeons/armor/types/leather/drop_common_loot_pick
