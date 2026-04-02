# dungeons/armor/process_player.mcfunction
# @s is the player
function vexp:dungeons/armor/detect_type
function vexp:dungeons/armor/hooks/tick with storage vexp:dungeons.armor armor_params
execute if score @s vexp.sprint matches 1.. run function vexp:dungeons/armor/hooks/on_sprint with storage vexp:dungeons.armor armor_params
