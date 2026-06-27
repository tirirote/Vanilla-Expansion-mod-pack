# @s is the player

# Trigger Loop
$execute if score @s $(score) matches $(loop).. run scoreboard players set @s $(score) $(end)

# Charging
$execute if score @s $(score) matches ..$(start) positioned ~ ~1.6 ~ run particle entity_effect{color:1178874167} ^ ^ ^2 0 0 0 1 0
$execute if score @s $(score) matches $(start)..$(end) positioned ~ ~1.6 ~ run particle entity_effect{color:2036744007} ^ ^ ^2 0 0 0 1 0
$execute if score @s $(score) matches $(end).. positioned ~ ~1.6 ~ positioned ^ ^ ^2 run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 0.8, dX: 0, dY: 0, dZ: 0, speed: 1, count: 1}


# End
$execute if score @s $(score) matches $(end) positioned ~ ~1.6 ~ run particle flash{color:-8637360} ^ ^ ^2 1 1 1 1 0
$execute if score @s $(score) matches $(end) positioned ~ ~1.6 ~ run particle flame ^ ^ ^2 0 0 0 0.02 0

$execute if score @s $(score) matches 1 run function vexp:utils/sound {sound: "minecraft:item.crossbow.loading_start", type: "player"}

