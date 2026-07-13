# On spawn hook
# @s is the interaction

execute unless data entity @s data.vexp.item_count run data modify entity @s data.vexp.item_count set value 0
tag @s remove vexp.bag_opened
