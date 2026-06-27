# @s is the player

# Trigger Loop
$execute if score @s $(score) matches $(loop).. run scoreboard players set @s $(score) $(end)

# Charging
$execute if score @s $(score) matches ..$(start) positioned ~ ~1.6 ~ run particle entity_effect{color:1091273367} ^ ^ ^2 0 0 0 1 0
$execute if score @s $(score) matches $(start)..$(end) positioned ~ ~1.6 ~ run particle entity_effect{color:2080415653} ^ ^ ^2 0 0 0 1 0
$execute if score @s $(score) matches $(end).. positioned ~ ~1.6 ~ run particle entity_effect{color:327646} ^ ^ ^2 0 0 0 1 0

# End
$execute if score @s $(score) matches $(end) positioned ~ ~1.6 ~ run particle flash{color:-7340061} ^ ^ ^2 1 1 1 1 0
$execute if score @s $(score) matches $(end) positioned ~ ~1.6 ~ run particle enchanted_hit ^ ^ ^2 0 0 0 1 0

$execute if score @s $(score) matches 1 run function vexp:utils/sound {sound: "minecraft:item.crossbow.loading_start", type: "player"}

