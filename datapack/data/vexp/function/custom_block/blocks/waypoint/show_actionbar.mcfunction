# show_actionbar.mcfunction
# Macro: ejecuta actualización de actionbar en jugadores que sostienen
# el marcador waypoint con custom_name coincidente.
# Input: $(name)

execute as @a[distance=..256] if data entity @s SelectedItem.components."minecraft:entity_data".data.vexp{id:"waypoint"} at @s run function vexp:custom_block/blocks/waypoint/match_selected_name with storage vexp:waypoint display
