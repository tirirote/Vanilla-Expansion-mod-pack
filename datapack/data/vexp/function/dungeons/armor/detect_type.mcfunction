# dungeons/armor/detect_type.mcfunction
# @s is the player
# Output in storage vexp:dungeons.armor armor_params {type:"..."}

data modify storage vexp:dungeons.armor armor_params set value {quality:"none"}

execute if items entity @s armor.head *[custom_data~{vexp:{item:"armor"}}] run data modify storage vexp:dungeons.armor armor_params.quality set from entity @s equipment.head.components."minecraft:custom_data".vexp.quality
