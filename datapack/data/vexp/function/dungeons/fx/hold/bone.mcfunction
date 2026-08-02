# @s is the player

# Trigger Loop
$execute if score @s $(score) matches $(loop).. run scoreboard players set @s $(score) $(end)

# Charging
$execute if score @s $(score) matches ..$(start) positioned ~ ~1.6 ~ positioned ^ ^ ^2 run function vexp:utils/feedback/trail_particle {col:-8751273, duration:17, dX:1, dY:1, dZ:1, count:1, speed:1}
$execute if score @s $(score) matches $(start)..$(end) positioned ~ ~1.6 ~ positioned ^ ^ ^2 run function vexp:utils/feedback/trail_particle {col:-5461630, duration:11, dX:1, dY:1, dZ:1, count:3, speed:1}
$execute if score @s $(score) matches $(end).. positioned ~ ~1.6 ~ positioned ^ ^ ^2 run function vexp:utils/feedback/trail_particle {col:-1780047, duration:7, dX:1, dY:1, dZ:1, count:5, speed:1}

# End
$execute if score @s $(score) matches $(end) positioned ~ ~1.6 ~ run particle flash{color:-291} ^ ^ ^2 1 1 1 1 0
$execute if score @s $(score) matches $(end) positioned ~ ~1.6 ~ run particle crit ^ ^ ^2 0 0 0 1 0

$execute if score @s $(score) matches 1 run function vexp:utils/sound {sound: "minecraft:item.crossbow.loading_start", type: "player", pitch:1}
