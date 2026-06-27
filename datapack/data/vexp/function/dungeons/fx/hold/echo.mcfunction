# @s is the player

# Trigger Loop
$execute if score @s $(score) matches $(loop).. run scoreboard players set @s $(score) $(end)

# Charging
$execute if score @s $(score) matches ..$(start) positioned ~ ~1.6 ~ run particle entity_effect{color:2032356461} ^ ^ ^2 0 0 0 1 0
$execute if score @s $(score) matches $(start)..$(end) positioned ~ ~1.6 ~ run particle entity_effect{color:-1978951775} ^ ^ ^2 0 0 0 1 0
$execute if score @s $(score) matches $(end).. positioned ~ ~1.6 ~ run particle entity_effect{color:7733213} ^ ^ ^2 0 0 0 1 0

# End
$execute if score @s $(score) matches $(end) positioned ~ ~1.6 ~ run particle flash{color:-8454162} ^ ^ ^2 1 1 1 1 0
$execute if score @s $(score) matches $(end) positioned ~ ~1.6 ~ run particle sculk_charge_pop ^ ^ ^2 0 0 0 1 0

$execute if score @s $(score) matches 1 run function vexp:utils/sound {sound: "minecraft:item.crossbow.loading_start", type: "player"}

